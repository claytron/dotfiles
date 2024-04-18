silent! call plug#begin('~/.vim/bundle')
" Yank integration first since it maps all kinds of things
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'junegunn/vim-peekaboo'

" Language Syntax
Plug 'saltstack/salt-vim'
Plug 'smancill/conky-syntax.vim'
Plug 'sukima/xmledit'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-localorie'
Plug 'vim-scripts/bbcode'
Plug 'fatih/vim-go'
if !has('nvim')
  " This only works in standard vim
  Plug 'bfrg/vim-jqplay'
endif
" not sure why go doesn't work in polyglot...
let g:polyglot_disabled = ['go']
" Check if this has it before adding a new one...
Plug 'sheerun/vim-polyglot'

" Object manipulation
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/python_match.vim'

" Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jnurmine/Zenburn'
Plug 'IngoHeimbach/vim-mac-classic-theme'
Plug 'vim-scripts/marklar.vim'
Plug 'vim-scripts/simplewhite.vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonjapeterson/1989.vim'

" UI
Plug 'vim-airline/vim-airline' | Plug 'paranoida/vim-airlineish' | Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'gcmt/taboo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'preservim/nerdtree'
Plug 'janko-m/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/vim-searchindex'

" File Previews
Plug 'Rykka/InstantRst'
Plug 'shime/vim-livedown'

" VCS
Plug 'tpope/vim-fugitive' | Plug 'int3/vim-extradite' | Plug 'tpope/vim-rhubarb'

" Random
Plug 'claytron/RevealExtends'
Plug 'claytron/vimsizer'
Plug 'duff/vim-bufonly'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
Plug 'mhinz/vim-grepper'
Plug 'thinca/vim-visualstar'
Plug 'vim-scripts/TaskList.vim'
Plug 'yegappan/mru'
Plug 'rizzatti/dash.vim'
Plug 'urbainvaes/vim-remembrall'
Plug 'liuchengxu/graphviz.vim'
Plug 'neomake/neomake'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'github/copilot.vim'
call plug#end()
