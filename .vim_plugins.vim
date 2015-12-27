call plug#begin('~/.vim_plugged')

" File Previews
Plug 'Rykka/InstantRst'
Plug 'shime/vim-livedown'

" Color schemes
Plug 'altercation/vim-colors-solarized'

" Language Syntax
Plug 'vim-scripts/bbcode'
Plug 'smancill/conky-syntax.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'Rykka/riv.vim'
Plug 'saltstack/salt-vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'heartsentwined/vim-emblem'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'JulesWang/css.vim' | Plug 'genoma/vim-less'
Plug 'slim-template/vim-slim'
Plug 'superbrothers/vim-vimperator'
Plug 'sukima/xmledit'
Plug 'chrisbra/csv.vim'

" Fuzzy Finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'ctrlpvim/ctrlp.vim'

" VCS
Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-fugitive' | Plug 'int3/vim-extradite'

Plug 'majutsushi/tagbar'
Plug 'vim-scripts/TaskList.vim'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/python_match.vim'
Plug 'tpope/vim-repeat'
Plug 'mtth/scratch.vim'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline' | Plug 'paranoida/vim-airlineish'
Plug 'tpope/vim-rails'
Plug 'mhinz/vim-signify'
Plug 'claytron/vimsizer'
Plug 'thinca/vim-visualstar'
Plug 'vim-scripts/YankRing.vim'
Plug 'duff/vim-bufonly'
Plug 'scrooloose/nerdtree'
Plug 'claytron/RevealExtends'
Plug 'mileszs/ack.vim'
call plug#end()
