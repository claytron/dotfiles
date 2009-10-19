setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent
let python_highlight_all=1
au BufWinEnter,BufEnter,BufWrite,InsertEnter,InsertLeave * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
