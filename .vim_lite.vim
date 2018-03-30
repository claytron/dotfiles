" Minimal amount of settings for a good vim experience

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set modeline
set nocompatible

" Install the necessary plugins
call plug#begin('~/.vim_bundle_lite')
" Some sensibility
Plug 'tpope/vim-sensible'

" Gots to have it
Plug 'altercation/vim-colors-solarized'
call plug#end()

" turn on syntax highlighting
syntax on

" gui and terminal compatible color scheme
set t_Co=256
set background=dark

" Solarized settings
let g:solarized_termcolors=16
let g:solarized_diffmode='high'

" Set the theme
colorscheme solarized

" Show the currently typed command
set showcmd

" I will constantly do this, so set up jk as mode switch
map! jk <ESC>

" Set a shorter timeout length to make jk and jj easier to use
set timeoutlen=350

