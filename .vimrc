" FreeBSD security advisory for this one...
set nomodeline

" set the default encoding
set enc=utf-8

" set the title of the window
set title
set titlestring=%f%(\ [%M]%)

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" set the mapleader key
let mapleader = ","

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp

" turn on syntax highlighting
syntax on

" gui and terminal compatible color scheme
set t_Co=256
set background=dark
" a 256 color enhanced version of ir_black
colorscheme tir_black
" my mods to the theme
colorscheme tir_black_custom

" highlight the cursor line
set cursorline

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
set history=1000

" This setting ensures that each window contains a statusline that displays the
" current cursor position.
set ruler

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" set all window splits equal
set equalalways

" have the mouse enabled all the time:
set mouse=a
" make right click do something
set mousemodel=popup

" By default, vim doesn't let the cursor stray beyond the defined text. This 
" setting allows the cursor to freely roam anywhere it likes in command mode.
" It feels weird at first but is quite useful.
"set virtualedit=all

" tell the bell to go beep itself!
set vb

" Settings trying to make vim like TextMate :)
" --------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

" NERDTree settings
" -----------------------------------------------------------------
" set project folder to x
map <leader>x :NERDTree<CR>
" automagically open NERDTree
autocmd VimEnter * exe 'NERDTree' | wincmd l
" files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
let NERDTreeIgnore=['\~$', '\.pt.cache$', '\.Python$', '\.svn$', '\.git*$', '\.pyc$', '\.mo$', '\.o$', '\.lo$', '\.la$', '\..*.rej$', '\.rej$', '\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" -----------------------------------------------------------------

" shortcut for ack search
map <leader>a :Ack

" buffer explorer ctrl + tabbing
"let g:miniBufExplMapCTabSwitchWindows = 1
"let g:miniBufExplMapWindowNavVim = 1

" automatically use the wiki text for trac.sixfeetup.com when
" using it's all text
au BufNewFile,BufRead trac.sixfeetup.com.*.txt set syntax=wiki
" markdown syntax
au BufNewFile,BufRead *.{md|mdown|markdown} set syntax=mkd

" fuzzy finder text mate mapping
map <leader>t :FuzzyFinderTextMate<CR>

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" Insert newlines with enter and shift + enter
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" map ; to : so you don't have to use shift
map ; :

" set up the invisible characters
" -----------------------------------------------------------------
set listchars=eol:¬,tab:>-
" show invisible characters by default
set list
" toggle invisible characters
:noremap <leader>i :set list!<CR>

