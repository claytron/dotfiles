" Custom setttings for Python files
" -----------------------------------------------------------------

" make sure tabs are set up properly in python
setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent autoindent
" Highlight lines past column 80 in python files
au BufWinEnter,BufEnter,BufWrite,InsertEnter,InsertLeave *.py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
" highlight builtins
let python_highlight_builtins=1
" remove trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
" run pep8 on the current file
map <leader>p :Shell pep8 %<CR>
