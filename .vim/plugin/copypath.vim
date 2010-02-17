" copypath.vim : Copy current editing file path to clipboard.
"
" Name Of File: copypath.vim
" Maintainer:   omi taku <mail@nanasi.jp>
" URL:          http://nanasi.jp/
" Script URL:   http://www.vim.org/scripts/script.php?script_id=1456
" Last Change:  2009/12/16
" Version:      1.0
"
" Installation:
"    1. Unzip copypath.zip ,
"       and extract there to your vim runtimepath directory ,
"       $HOME/vimfiles/plugin or $HOME/.vim/plugin directory directory.
"
"       Refer to ':help add-plugin', ':help add-global-plugin' and ':help runtimepath'
"       for more details about Vim plugins.
"
"    2. Restart Vim.
"    3. To run this script, Vim needs to be compiled with "+clipboard" option.
"
" Usage:
"    This script adds two new command ":CopyPath" and ":CopyFileName".
"    You can use the ":CopyPath" command to copy file path to clipboard,
"    and you can use the ":CopyFileName" command to copy file name to clipboard.
"
"    :CopyPath
"        copy current editing file full path to clipboard.
"        And, if you set g:copypath_copy_to_unnamed_register option to 1 then,
"        copy file full path to unnamed register too.
"        Default, not copy to unnamed register.
"
"    :CopyFileName
"        copy current editing file name to clipboard.
"        And, if you set g:copypath_copy_to_unnamed_register option to 1 then,
"        copy file name to unnamed register too.
"        Default, not copy to unnamed register.
"
" Configuration:
"    g:copypath_copy_to_unnamed_register
"       set this option value to 1 then, copy file path and name to unnamed register too.
"   >
"       let g:copypath_copy_to_unnamed_register = 1
"   <
"
" Note:
"    o  To run this script, Vim needs to be compiled with "+clipboard" option.
"
" History:
"    1.0     o  change uploading archive file format to zip format.
"    0.2     o  unnamed register copy option is added.
"    0.1.2   o  document is updated.
"    0.1.1   o  fix bug.
"    0.1     o  Initial upload.


" if plugin is already loaded then, not load plugin.
if exists("g:loaded_copypath")
    finish
endif
let g:loaded_copypath = 1

" if option is set then use open.
if !exists('g:copypath_copy_to_unnamed_register')
    let g:copypath_copy_to_unnamed_register = 0
endif

function CopyPath()
    let @*=expand('%:p')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:p')
    endif
endfunction

function CopyFileName()
    let @*=expand('%:t')
    " copy unnamed register.
    if g:copypath_copy_to_unnamed_register
        let @"=expand('%:t')
    endif
endfunction

command! -nargs=0 CopyPath     call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()

finish

" vim: set ts=4 sts=4 sw=4 et nowrap :
