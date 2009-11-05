" markdown filetype file
if exists("did_load_filetypes")
 finish
endif

let did_load_filetypes=1

augroup markdown
    au! BufRead,BufNewFile *.mkd setfiletype mkd
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.csv,*.dat,*.tsv setfiletype csv
augroup END
