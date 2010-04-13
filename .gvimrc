if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ 9,Liberation\ Mono\ 10,LucidaTypewriter\ Medium\ 10,Terminal
    set guioptions-=T " remove toolbar
    call ColorSwitch(g:dark_theme)
    autocmd GUIEnter * set vb t_vb=
    call SelectWindowSize("normal")
endif
