" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
" colorscheme default
let g:colors_name = "writeroom"

hi Normal     guifg=#00a000      guibg=Black
hi Normal     ctermfg=34         ctermbg=black
hi NonText    guifg=black
hi NonText    ctermfg=black
hi Search     guifg=Black        guibg=#606000   gui=bold
hi Search     ctermfg=black      ctermbg=58
hi Visual     guifg=#404040                      gui=bold
hi Visual     ctermfg=251
hi Cursor     guifg=Black        guibg=Green     gui=bold
hi CursorLine guibg=NONE
hi CursorLine cterm=NONE
hi Special    guifg=#004000
hi Special    ctermfg=28
hi Comment    guifg=#008000
hi Comment    ctermfg=40
hi StatusLine guifg=NONE         guibg=black
hi StatusLine ctermfg=NONE       ctermbg=black
hi LineNr     guibg=NONE         guifg=#232323
hi LineNr     ctermbg=NONE       ctermfg=238
" XXX: This doesn't seem to get rid of the bars in terminal...
hi VertSplit    ctermfg=black     ctermbg=Black
hi VertSplit    guifg=black     guibg=Black
hi FoldColumn guibg=NONE
hi FoldColumn ctermbg=NONE
hi Statement  guifg=#004000                      gui=NONE
hi Statement  ctermfg=28
hi constant   guifg=#005000                      gui=NONE
hi constant   ctermfg=22
hi preproc    guifg=#005000                      gui=NONE
hi preproc    ctermfg=22
hi Type                                          gui=NONE
