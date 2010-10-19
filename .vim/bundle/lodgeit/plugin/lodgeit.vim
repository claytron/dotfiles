" lodgeit.vim: Vim plugin for paste.pocoo.org
" Maintainer:   Armin Ronacher <armin.ronacher@active-4.com>
" Version:      0.3

if exists("loaded_lodgeit")
    finish
endif
let loaded_lodgeit = 1

" if there is no Python support, stop loading the plugin
if !has('python')
    echo "In order to use the Lodgeit plugin vim must be compiled with +python support"
    finish
endif

" Initialize some variables
if !exists("g:lodgeit_url")
    let g:lodgeit_url = "http://paste.pocoo.org"
endif
if !exists("g:lodgeit_secure")
    let g:lodgeit_secure = 0
endif

" Only load the keyring if using the secure method
if g:lodgeit_secure
python << EOF
import vim
import os.path
import sys

# get the directory this script is in and add to syspath
scriptdir = os.path.dirname(vim.eval('expand("<sfile>")'))
keyring_dir = "%s/keyring" % os.path.abspath(scriptdir)
if os.path.exists(keyring_dir):
    sys.path.insert(0, keyring_dir)
EOF
endif

function! s:LodgeitInit()
python << EOF
import vim
import re
from xmlrpclib import ServerProxy
from xmlrpclib import ProtocolError

lodgeit_url = vim.eval("g:lodgeit_url")

def python_input(message='input', secret=False):
    input_type = 'input'
    if secret:
        input_type = "inputsecret"
    vim.command('call inputsave()')
    vim.command("let user_input = %s('%s')" % (input_type, message))
    vim.command('call inputrestore()')
    return vim.eval('user_input')


def get_full_url(password_reset=False):
    use_password = int(vim.eval("g:lodgeit_secure"))
    if not use_password:
        return lodgeit_url
    # test for the keyring support
    try:
        import keyring
        has_keyring = True
    except ImportError:
        has_keyring = False
    if has_keyring:
        # Check for the username var, if it doesn't exist, ask for it
        username_exists = int(vim.eval("exists('g:lodgeit_username')"))
        if username_exists:
            username = vim.eval("g:lodgeit_username")
        else:
            username = python_input("username: ")
        password = None
        # ignore the keyring if we are trying to reset the password
        if not password_reset:
            # Get the password out of the keyring
            password = keyring.get_password(lodgeit_url, username)
        if password is None:
            password = python_input("password: ", secret=True)
            keyring.set_password(lodgeit_url, username, password)
    else:
        # If there is no keyring support, ask for the username and password
        username = python_input("username: ")
        password = python_input("password: ", secret=True)
    # Determine if the paste url is behind SSL
    if lodgeit_url[:5] == "https":
        protocol = "https"
        domain = lodgeit_url[8:]
    else:
        protocol = "http"
        domain = lodgeit_url[7:]
    return "%s://%s:%s@%s" % (protocol, username, password, domain)


full_lodgeit_url = get_full_url()
while True:
    try:
        srv = ServerProxy('%s/xmlrpc/' % full_lodgeit_url, allow_none=True)
        # an arbitrary check for authorization
        srv.system.listMethods()
        break
    except (ProtocolError), error:
        error_code = error.errcode
        if error_code == 401:
            full_lodgeit_url = get_full_url(password_reset=True)
        else:
            # TODO: handle other errors properly
            break

new_paste = srv.pastes.newPaste
get_paste = srv.pastes.getPaste

language_mapping = {
    'python':           'python',
    'php':              'html+php',
    'smarty':           'smarty',
    'tex':              'tex',
    'rst':              'rst',
    'cs':               'csharp',
    'haskell':          'haskell',
    'xml':              'xml',
    'html':             'html',
    'xhtml':            'html',
    'htmldjango':       'html+django',
    'django':           'html+django',
    'htmljinja':        'html+django',
    'jinja':            'html+django',
    'lua':              'lua',
    'scheme':           'scheme',
    'mako':             'html+mako',
    'c':                'c',
    'cpp':              'cpp',
    'javascript':       'js',
    'jsp':              'jsp',
    'ruby':             'ruby',
    'bash':             'bash',
    'bat':              'bat',
    'd':                'd',
    'genshi':           'html+genshi'
}

language_reverse_mapping = {}
for key, value in language_mapping.iteritems():
    language_reverse_mapping[value] = key

def paste_id_from_url(url):
    regex = re.compile(r'^%s/show/([^/]+)/?$' % full_lodgeit_url)
    m = regex.match(url)
    if m is not None:
        return m.group(1)

def make_utf8(code):
    enc = vim.eval('&fenc') or vim.eval('&enc')
    return code.decode(enc, 'ignore').encode('utf-8')

EOF
endfunction


function! s:Lodgeit(line1,line2,count,...)
call s:LodgeitInit()
python << endpython

# download paste
if vim.eval('a:0') == '1':
    paste = paste_id = None
    arg = vim.eval('a:1')

    if arg.startswith('#'):
        paste_id = arg[1:].split()[0]
    if paste_id is None:
        paste_id = paste_id_from_url(vim.eval('a:1'))
    if paste_id is not None:
        paste = get_paste(paste_id)

    if paste:
        vim.command('tabnew')
        vim.command('file Lodgeit\ Paste\ \#%s' % paste_id)
        vim.current.buffer[:] = paste['code'].splitlines()
        vim.command('setlocal ft=' + language_reverse_mapping.
                    get(paste['language'], 'text'))
        vim.command('setlocal nomodified')
        vim.command('let b:lodgeit_paste_id="%s"' % paste_id)
    else:
        print 'Paste not Found'

# new paste or reply
else:
    rng_start = int(vim.eval('a:line1')) - 1
    rng_end = int(vim.eval('a:line2'))
    if int(vim.eval('a:count')):
        code = '\n'.join(vim.current.buffer[rng_start:rng_end])
    else:
        code = '\n'.join(vim.current.buffer)
    code = make_utf8(code)

    parent = None
    update_buffer_info = False
    if vim.eval('exists("b:lodgeit_paste_id")') == '1':
        parent = int(vim.eval('b:lodgeit_paste_id'))
        update_buffer_info = True

    lng_code = language_mapping.get(vim.eval('&ft'), 'text')
    paste_id = new_paste(lng_code, code, parent)
    url = '%s/show/%s' % (lodgeit_url, paste_id)

    print 'Pasted #%s to %s' % (paste_id, url)
    vim.command(':call setreg(\'+\', %r)' % url)

    if update_buffer_info:
        vim.command('file Lodgeit\ Paste\ \#%s' % paste_id)
        vim.command('setlocal nomodified')
        vim.command('let b:lodgeit_paste_id="%s"' % paste_id)

endpython
endfunction

command! -range=0 -nargs=* Lodgeit :call s:Lodgeit(<line1>,<line2>,<count>,<f-args>)
