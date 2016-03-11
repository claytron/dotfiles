" Custom settings for Python files
" -----------------------------------------------------------------

" make sure tabs are set up properly in python
setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent autoindent spell spelllang=en_us

" Highlight lines past column 80 in python files
au BufWinEnter,BufEnter * call clearmatches()
au BufWinEnter,BufEnter *.{v,c,}py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
" Clear the line length highlight
noremap <silent> col :call clearmatches()<CR>

" remove trailing whitespace on save
autocmd BufWritePre *.{v,c,}py :StripTrailingWhitespaces

" Use 4 space indents
TabStyle space 4
