" FreeBSD security advisory for this one...
set nomodeline

" Enhanced command menu ctrl + d to expand directories
set wildmenu

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
let g:mapleader = ","

" set up jj as mode switch
map! jj <ESC>

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
set autoindent
set smartindent

" turn off indentation when pasting
set pastetoggle=<F2>

" function to switch between tabs and spaces
" taken from: http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc
function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
endfunction
 
function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set expandtab
endfunction
 
call Tabstyle_spaces()

" This setting will cause the cursor to very briefly jump to a 
" brace/parenthese/bracket's "match" whenever you type a closing or 
" opening brace/parenthese/bracket.
set showmatch

" -----------------------------------------------------------------
" Searching
" -----------------------------------------------------------------
" find as you type
set incsearch
" highlight the terms
set hlsearch
" make searches case-insensitive
set ignorecase
" unless they contain upper-case letters
set smartcase
" a toggle for search highlight
map <leader>h :nohl<CR>

" have fifty lines of command-line (etc) history:
set history=1000

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

"Set 7 lines to the curors - when moving vertical..
set so=7

" set a custom status line similar to that of ":set ruler"
set statusline=\ \ \ \ \ line:%l\ column:%c\ \ \ %M%Y%r%=%-14.(%t%)\ %p%%
" show the statusline in all windows
set laststatus=2

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
set visualbell t_vb=

" Settings trying to make vim like TextMate :)
" --------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on            " enables filetype detection
filetype plugin indent on     " enables filetype specific plugins

" NERDTree settings
" -----------------------------------------------------------------
" set project folder to x
map <leader>x :NERDTree<CR>
" files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
let NERDTreeIgnore=['\~$', '\.pt.cache$', '\.Python$', '\.svn$', '\.git*$', '\.pyc$', '\.pyo$', '\.mo$', '\.o$', '\.lo$', '\.la$', '\..*.rej$', '\.rej$', '\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" when the root is changed, change Vim's working dir
let NERDTreeChDirMode=2
" -----------------------------------------------------------------

" Fuzzy finder textmate plugin
" -----------------------------------------------------------------
" max results, lot o' files in a buildout :)
let g:fuzzy_ceiling=35000
" show full paths
let g:fuzzy_path_display = 'highlighted_path'
" ignored files
let g:fuzzy_ignore = "*.png;*.PNG;*.pyc;*.pyo;*.JPG;*.jpg;*.GIF;*.gif;.svn/**;.git/**;*.mo"

" shortcut for ack search
map <leader>a :Ack

" buffer explorer ctrl + tabbing and single click
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" automatically use the wiki text for trac.sixfeetup.com when
" using it's all text
au BufNewFile,BufRead trac.sixfeetup.com.*.txt set syntax=wiki
" markdown syntax
au BufNewFile,BufRead *.{md|mdown|markdown} set syntax=mkd

" Zope and Plone files
" -----------------------------------------------------------------
" xml syntax for zcml files
au BufNewFile,BufRead *.zcml set filetype=xml
" css.dtml as css
au BufNewFile,BufRead *.css.dtml set filetype=css
" js.dtml as javascript
au BufNewFile,BufRead *.js.dtml set filetype=javascript

" fuzzy finder text mate mapping
map <leader>t :FuzzyFinderTextMate<CR>

" Make cursor move by visual lines instead of file lines (when wrapping)
" This makes me feel more at home :)
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
set listchars=eol:¬,tab:»\ 
" show invisible characters by default
set list
" toggle invisible characters
noremap <leader>i :set list!<CR>

" mapping for taglist
nnoremap tt :TlistToggle<CR>

" -----------------------------------------------------------------
" GUI settings
" -----------------------------------------------------------------
if has("gui_running")

    " Default size of window
    set columns=145
    set lines=45
    
    " automagically open NERDTree in a GUI
    autocmd VimEnter * exe 'NERDTreeToggle' | wincmd l

    " OS Specific
    if has("gui_macvim")
        "set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
        set guifont=Monaco:h10
        set guioptions-=T " remove toolbar
    elseif has("gui_gtk2")
        set guifont=Terminal
        set guioptions-=T " remove toolbar
        colorscheme tir_black
        colorscheme tir_black_custom
    elseif has("x11")
    elseif has("gui_win32")
    end

endif
