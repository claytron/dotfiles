" set the nginx filetype for any file under etc/nginx for any file layout
" /etc /usr/local/etc /opt/local/etc, etc.
au BufRead,BufNewFile */etc/nginx/* set filetype=nginx
