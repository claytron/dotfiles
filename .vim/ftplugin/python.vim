" Custom settings for Python files
" -----------------------------------------------------------------
" Highlight lines past column 80 in python files
au BufWinEnter,BufEnter * call clearmatches()
au BufWinEnter,BufEnter *.{v,c,}py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
" Clear the line length highlight
noremap <silent> col :call clearmatches()<CR>

" remove trailing whitespace on save
autocmd BufWritePre *.{v,c,}py :RemoveTrailingSpaces

" Use 4 space indents
TabStyle space 4
