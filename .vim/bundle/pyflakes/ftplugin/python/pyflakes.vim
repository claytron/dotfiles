" pyflakes.vim - A script to highlight Python code on the fly with warnings
" from Pyflakes, a Python lint tool.
"
" Place this script and the accompanying pyflakes directory in
" .vim/ftplugin/python.
"
" See README for additional installation and information.
"
" Thanks to matlib.vim for ideas/code on interactive linting.
"
" Maintainer: Kevin Watters <kevin.watters@gmail.com>
" Version: 0.1

if exists("b:did_pyflakes_plugin")
    finish " only load once
else
    let b:did_pyflakes_plugin = 1
endif

if !exists("b:did_python_init")
    let b:did_python_init = 0

    if !has('python')
        finish
    endif

    python << EOF
import vim
import os.path
import sys

if sys.version_info[:2] < (2, 5):
    raise AssertionError('Vim must be compiled with Python 2.5 or higher; you have ' + sys.version)

# get the directory this script is in: the pyflakes python module should be installed there.
scriptdir = os.path.join(os.path.dirname(vim.eval('expand("<sfile>")')), 'pyflakes')
sys.path.insert(0, scriptdir)
EOF
    let b:did_python_init = 1
endif

if !b:did_python_init
    finish
endif
