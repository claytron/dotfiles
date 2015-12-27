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

" UI
Plug 'bling/vim-airline' | Plug 'paranoida/vim-airlineish'
Plug 'gcmt/taboo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
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
Plug 'ervandew/supertab'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-visualstar'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/YankRing.vim'
call plug#end()
