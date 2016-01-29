call plug#begin('~/.vim_plugged')
" Language Syntax
Plug 'chrisbra/csv.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'heartsentwined/vim-emblem'
Plug 'JulesWang/css.vim' | Plug 'genoma/vim-less'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'Rykka/riv.vim'
Plug 'saltstack/salt-vim'
Plug 'slim-template/vim-slim'
Plug 'smancill/conky-syntax.vim'
Plug 'sukima/xmledit'
Plug 'superbrothers/vim-vimperator'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/bbcode'

" Object manipulation
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/python_match.vim'

" Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jnurmine/Zenburn'
Plug 'IngoHeimbach/vim-mac-classic-theme'
Plug 'vim-scripts/marklar.vim'
Plug 'vim-scripts/simplewhite.vim'
Plug 'tomasr/molokai'

" UI
Plug 'vim-airline/vim-airline' | Plug 'paranoida/vim-airlineish' | Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'gcmt/taboo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'

" File Previews
Plug 'Rykka/InstantRst'
Plug 'shime/vim-livedown'

" VCS
Plug 'tpope/vim-fugitive' | Plug 'int3/vim-extradite'
Plug 'vim-scripts/vcscommand.vim'

" Random
Plug 'claytron/RevealExtends'
Plug 'claytron/vimsizer'
Plug 'duff/vim-bufonly'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-visualstar'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'yegappan/mru'
call plug#end()
