" taken from molokai.vim
if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif

hi Special         guifg=#66D9EF guibg=bg gui=none
hi Visual          guifg=NONE    guibg=#262D51     gui=NONE
hi Statement       gui=none
hi Constant        gui=none

" make python builtins stand out more
hi link pythonBuiltinObj Constant
hi link pythonExClass Constant
hi link pythonBuiltinFunc Special

hi link TagListFileName Normal

" Set the condition "original" styles
if s:molokai_original == 1
   hi VertSplit       guibg=#1B1D1E guifg=#3B3A32 gui=bold
   hi FoldColumn      guibg=#1B1D1E guifg=#3B3A32 gui=bold
   hi NonText         guifg=#494949 guibg=NONE
else
   hi VertSplit       guibg=#1B1D1E guifg=#3B3A32 gui=bold
   hi FoldColumn      guibg=#1B1D1E guifg=#3B3A32 gui=bold
   hi NonText         guifg=#494949 guibg=NONE
end

" Support for 256-color terminal
if &t_Co > 255
   hi Special         ctermfg=81  ctermbg=NONE
   hi VertSplit       ctermfg=238 ctermbg=236   cterm=bold
   hi LineNr          ctermfg=250 ctermbg=238
   hi NonText         ctermfg=239 ctermbg=NONE
end

