" vim writeroom mode

" Default size of window
setlocal lines=40 columns=80

" disable some common settings
set nonumber
set laststatus=0
set nolist
set nocursorline

" XXX: this is a hack. push terminal content over a bit
set foldcolumn=12

set background=dark
" use the writeroom colors
colorscheme wr

if has("gui_running")

    " unhack the previous
    set foldcolumn&

    " OS Specific
    if has("gui_macvim")
        set guifont=Monaco:h17
        " disable all of the GUI
        set guioptions=
        " make sure to retain our lines and columns
        set fuoptions=
        " `fullscreen` needs to go after `lines` etc
        set fullscreen
    endif
endif
