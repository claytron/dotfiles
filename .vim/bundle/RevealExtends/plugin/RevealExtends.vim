" RevealExtends
" Version: 1.0
" Author : Clayton Parker <robots AT claytron DOT com>
" License: WTFPLv2 http://sam.zoy.org/wtfpl/

if exists('g:loaded_RevealExtends')
    finish
endif
let g:loaded_RevealExtends = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:RevealExtends(line1, line2, count, ...)
    " marker to know if the file/url exists
    let g:extends_exists = 0
    let s:config_file = expand("~/.buildout/default.cfg")
    if !filereadable(s:config_file)
        if exists('a:1')
            call s:openURL(s:cleanUpWhitespace(a:1))
        endif
        if !g:extends_exists
            echo "Default buildout config not found: " . s:config_file
        endif
        " clean up variable
        unlet g:extends_exists
        return
    endif
    if exists('a:1')
        let s:hash_string = s:cleanUpWhitespace(a:1)
    else
        " save the register to put it back later
        let s:original_reg = @"
        " If there is no count, just use the current line
        if a:count == 0
            silent execute a:line1 . "," . a:line1 . "yank"
        else
            silent normal! gvy
        endif
        " get rid of spaces and newlines
        let s:hash_string = s:cleanUpWhitespace(@")
        " set the register back to the previous contents
        let @" = s:original_reg
    endif
    " find the extends cache directory
    let s:dirname = s:cleanUpWhitespace(system("awk -F= '/^extends/ {print $2}' ~/.buildout/default.cfg"))
    " get the md5 hash of the url string
    let s:filename = s:cleanUpWhitespace(system("md5 -s '" . s:hash_string . "' | awk '{print $4}'"))
    let s:file_path = s:dirname . "/" . s:filename
    if filereadable(s:file_path)
        let g:extends_exists = 1
        " open up the file in a scratch buffer
        call s:openScratchBuffer(s:file_path)
    else
        call s:openURL(s:hash_string)
    endif
    if !g:extends_exists
        echo "No file in the cache (" . s:dirname . ") for '" . s:hash_string . "'"
    endif
    " clean up variable
    unlet g:extends_exists
endfunction

function! s:openURL(url)
    if has('python')
python << ENDPYTHON
import vim
from tempfile import NamedTemporaryFile
from urllib import urlopen
url = vim.eval('a:url')
# try/except in case the string is not a URL
try:
    extends_file = urlopen(url)
    # TODO: handle redirect, etc.
    if extends_file.code == 200:
        # we have an extends file
        vim.command('let g:extends_exists = 1')
        contents = extends_file.read()
        # create a temporary file to put the url contents into
        tmp_file = NamedTemporaryFile()
        tmp_file.write(contents)
        # seek to the beginning of the file so we can read it
        tmp_file.seek(0)
        vim.command('let s:file_path = "%s"' % tmp_file.name)
        # open up the scratch buffer
        vim.command('call s:openScratchBuffer(s:file_path)')
        # close our files, deleting the tmp file
        tmp_file.close()
        extends_file.close()
except IOError:
    pass
ENDPYTHON
    else
        echo "Cannot attempt to download url, vim must be compiled with Python support"
    endif
endfunction

function! s:openScratchBuffer(file_path)
    " Create a scractch buffer
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap filetype=cfg
    " Read the file into the scratch buffer
    let s:escaped_path = fnameescape(a:file_path)
    execute "read " . s:escaped_path
endfunction

function! s:cleanUpWhitespace(dirty_string)
    " remove beginning and trailing whitespace
    let s:no_whitespace = substitute(substitute(a:dirty_string, '^\s*', '', 'g'), '\s*$', '', 'g')
    " remove all newlines
    return substitute(s:no_whitespace, '\n', '', 'g')
endfunction

" command to run the reveal function
command! -nargs=? -range=0 RevealExtends call s:RevealExtends(<line1>, <line2>, <count>, <f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
