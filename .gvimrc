" OS Specific
" *****************************************************************
if has("gui_macvim")
  
    "set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
    set guifont=Monaco:h13
    set guioptions-=T " remove toolbar
    set stal=2 " turn on tabs by default

elseif has("gui_gtk2")
         
    set guifont=Terminal
    set guioptions-=T " remove toolbar
    colorscheme tir_black
    colorscheme tir_black_custom
 
elseif has("x11")
elseif has("gui_win32")
end

" Default size of window
set columns=120
set lines=45

" automagically open NERDTree
autocmd VimEnter * exe 'NERDTree' | wincmd l

