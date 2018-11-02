silent! call plug#begin('~/.vim/bundle')
" Yank integration first since it maps all kinds of things
Plug 'maxbrunsfeld/vim-yankstack'

" Language Syntax
Plug 'chrisbra/csv.vim'
Plug 'chr4/nginx.vim'
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
Plug 'airblade/vim-localorie'
Plug 'vim-scripts/bbcode'
Plug 'elzr/vim-json'
Plug 'vim-python/python-syntax'
Plug 'fatih/vim-go'

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
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
if has('nvim')
  Plug 'roxma/nvim-completion-manager'
endif

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
"Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'thinca/vim-visualstar'
Plug 'vim-scripts/TaskList.vim'
Plug 'yegappan/mru'
Plug 'rizzatti/dash.vim'
" Only for whitespace cleanup now.
Plug 'Chiel92/vim-autoformat'
Plug 'ianks/neoformat'
Plug 'urbainvaes/vim-remembrall'
call plug#end()
