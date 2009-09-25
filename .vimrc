" FreeBSD security advisory for this one...
set nomodeline

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" turn on syntax highlighting
syntax on

set t_Co=256
set background=dark
colorscheme ir_black

" turn on line numbers, aww yeah
set number

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
"set autoindent
"set smartindent

" I prefer 4-space tabs to 8-space tabs. The first setting sets up 4-space
" tabs, and the second tells vi to use 4 spaces when text is indented (auto or
" with the manual indent adjustmenters.)
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" This setting will cause the cursor to very briefly jump to a 
" brace/parenthese/bracket's "match" whenever you type a closing or 
" opening brace/parenthese/bracket.
set showmatch

" find as you type
set incsearch

" make searches case-insensitive
set ignorecase
" unless they contain upper-case letters
set smartcase

" have fifty lines of command-line (etc) history:
set history=50

" This setting ensures that each window contains a statusline that displays the
" current cursor position.
set ruler

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" have the mouse enabled all the time:
set mouse=a

" By default, vim doesn't let the cursor stray beyond the defined text. This 
" setting allows the cursor to freely roam anywhere it likes in command mode.
" It feels weird at first but is quite useful.
"set virtualedit=all

" Settings trying to make vim like TextMate :)
" --------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

" set project folder to \x
map <leader>x :NERDTree<CR>

" shortcut for ack search
map <leader>a :Ack

