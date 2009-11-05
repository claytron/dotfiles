" markdown filetype file
if exists("did_load_filetypes")
 finish
endif

augroup markdown
    au! BufRead,BufNewFile *.mkd setfiletype mkd
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.csv,*.dat,*.tsv setfiletype csv
augroup END
