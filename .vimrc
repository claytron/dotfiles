" -----------------------------------------------------------------
"
"  NOTE: some settings are set up in a common rc file so that both
"        vim and vimperator can use them. See ~/.vim_commonrc
"
" The mapleader has been switched from '\' to ',' anytime you see
" <leader> that is what this refers to.
"
"    <leader>t       -- opens the TextMate fuzzy finder
"    tt              -- opens up the taglist
"    <leader>h       -- toggles the highlight search
"    <leader>n       -- toggles the line numbers
"    <leader>a       -- starts an ack search in the CWD
"    <leader>i       -- toggles invisible characters
"    <leader>x       -- toggles NERDTree drawer
"    <leader>b       -- shortcut for getting to NERDTree bookmarks
"    <leader><Enter> -- opens a line at the current column (this is
"                       the reverse of J)
"    <leader>c       -- Switch between light and dark colors
"    jj              -- alternative to <ESC>
"    ;               -- alternative to :
"    ctrl + tab      -- cycle through buffers/tabs
"    <Enter>         -- open a new line (non-insert)
"    <S-Enter>       -- open a new line above (non-insert)
"    <leader>s       -- Toggle spell checking
"    <F2>            -- Toggle smart indent on paste
"    CTRL-=          -- Make the current window taller
"    CTRL-- (CTRL-DASH) -- Make the current window shorter
"
" -----------------------------------------------------------------

" set a common set of options for vim and vimperator
source ~/.vim_commonrc

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

" Enhanced command menu ctrl + d to expand directories
set wildmenu
set wildignore+=*.pyc,*.pyo,CVS,.svn,.git,*.mo,.DS_Store,*.pt.cache,*.Python,*.o,*.lo,*.la,*~

" set up jj as mode switch
map! jj <ESC>

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

" turn on spell checking
set spell spelllang=en_us
map <silent> <leader>s :set spell!<CR>

" -----------------------------------------------------------------
" Colors and Syntax
" -----------------------------------------------------------------
" turn on syntax highlighting
syntax on

" gui and terminal compatible color scheme
set t_Co=256
set background=dark
" a 256 color enhanced version of ir_black
colorscheme tir_black
" my mods to the theme
colorscheme tir_black_custom

" A function to toggle between light and dark colors
function! ColorSwitch()
    " check for the theme, and switch to the other one.
    " I had this working with &background == 'dark/light' but something
    " stopped working for me :()
    if g:colors_name == 'tir_black'
        colorscheme simplewhite
        colorscheme simplewhite_custom
    elseif g:colors_name == 'simplewhite'
        colorscheme tir_black
        colorscheme tir_black_custom
        return
    endif
endfunction

" switch between light and dark colors
map <silent> <leader>c :call ColorSwitch()<CR>

" highlight the cursor line
set cursorline

" turn on line numbers, aww yeah
set number
" shortcut to turn off line numbers
map <silent> <leader>n :set number!<CR>

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
set autoindent
set smartindent

" turn off smart indentation when pasting
set pastetoggle=<F2>

" turn on tsv in csv mode
function! Csv_tsv()
  let b:delimiter='\t'
  let b:col=substitute(b:col, ',', '\t', 'g')
endfunction

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

" function to run shell commands and create a scratch buffer (modified
" slightly so that it doesn't show the command and it's interpretation)
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" Example, show output of ls in a scratch buffer:
"
" :Shell ls -al
"
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1,substitute(getline(1),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" This setting will cause the cursor to very briefly jump to a 
" brace/parenthese/bracket's "match" whenever you type a closing or 
" opening brace/parenthese/bracket.
set showmatch

" have fifty lines of command-line (etc) history:
set history=1000

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" Set a margin of lines when scrolling
set so=4

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

" make sure the bell shuts up
set t_vb=

" --------------------------------------------
" Settings trying to make vim like TextMate :)
" --------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on            " enables filetype detection
filetype plugin indent on     " enables filetype specific plugins

" NERDTree settings
" -----------------------------------------------------------------
" set project folder to x
map <leader>x :NERDTreeToggle<CR>
map <leader>b :NERDTreeFromBookmark<Space>
nnoremap <silent> <leader>f :call FindInNERDTree()<CR>
" files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
let NERDTreeIgnore=[
    \'\~$',
    \'\.pt.cache$',
    \'\.Python$',
    \'\.svn$',
    \'\.git*$',
    \'\.pyc$',
    \'\.pyo$',
    \'\.mo$',
    \'\.o$',
    \'\.lo$',
    \'\.la$',
    \'\..*.rej$',
    \'\.rej$',
    \'\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" when the root is changed, change Vim's working dir
let NERDTreeChDirMode=2
" -----------------------------------------------------------------

" Fuzzy finder TextMate plugin
" -----------------------------------------------------------------
" max results, lot o' files in a buildout :)
let g:fuzzy_ceiling=35000
" show full paths
let g:fuzzy_path_display = 'highlighted_path'
" ignored files
let g:fuzzy_ignore = "*.png;*.PNG;*.pyc;*.pyo;*.JPG;*.jpg;*.GIF;*.gif;.svn/**;.git/**;*.mo;.DS_Store"

" shortcut for ack search
map <leader>a :Ack<Space>

" buffer explorer ctrl + tabbing and single click
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" automatically use the wiki text for trac.sixfeetup.com when
" using it's all text
au BufNewFile,BufRead *trac.sixfeetup.com.* set syntax=wiki

" markdown syntax (lot's of extension variants on that one)
augroup mkd
 autocmd BufNewFile,BufRead *.{mkd,mdown,md,markdown,mark,mkdn}  set ai ft=mkd formatoptions=tcroqn2 comments=n:>
augroup END
command! -complete=file -nargs=* MarkdownToHTML  call s:RunShellCommand('Markdown.pl %')
command! -complete=file -nargs=* MarkdownToHTMLCopy  !Markdown.pl % | pbcopy

" shell files
au BufNewFile,BufRead .common* set filetype=sh

" Zope and Plone files
" -----------------------------------------------------------------
" xml syntax for zcml files
au BufNewFile,BufRead *.zcml set filetype=xml
" css.dtml as css
au BufNewFile,BufRead *.css.dtml set filetype=css
" js.dtml as javascript
au BufNewFile,BufRead *.js.dtml set filetype=javascript
" any txt file in a `tests` directory is a doctest
au BufNewFile,BufRead /*/tests/*.txt set filetype=doctest

" fuzzy finder text mate mapping
map <silent> <leader>t :FuzzyFinderTextMate<CR>

" Make cursor move by visual lines instead of file lines (when wrapping)
" This makes me feel more at home :)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" window resizing
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Insert newlines with enter and shift + enter
map <S-Enter> O<ESC>
map <Enter> o<ESC>
" open a new line from the current spot (sort of the opposite of J)
map <leader><Enter> i<CR><ESC>

" turn on writeroom
map <silent> <F8> :source ~/.vim/nightroom.vim<CR>

" map ; to : so you don't have to use shift
map ; :

" set up the invisible characters
" -----------------------------------------------------------------
set listchars=eol:¬,tab:»\ 
" show invisible characters by default
set list
" toggle invisible characters
noremap <silent> <leader>i :set list!<CR>

" make the taglist show on the right side
let Tlist_Use_Right_Window = 1
" only show the current buffer, fold the rest
let Tlist_File_Fold_Auto_Close = 1
" show the name in the ctags list, helps with zope stuff :)
let tlist_xml_settings = 'zcml;n:name'
" mapping for taglist
nnoremap tt :TlistToggle<CR>

" -----------------------------------------------------------------
" GUI settings
" -----------------------------------------------------------------
if has("gui_running")

    " Default size of window
    set columns=215
    set lines=55
    
    " automagically open NERDTree in a GUI
    autocmd VimEnter * exe 'NERDTreeToggle' | wincmd l
    " close the NERDTree when opening it's all text and vimperator
    " editors
    autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/*.txt,vimperator-* exe 'NERDTreeClose'
    autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/*.txt,vimperator-* set nonumber nospell

    " turn off the gui elements
    set guioptions=

    " OS Specific
    if has("gui_macvim")
        " use the whole screen
        set fuoptions=maxvert,maxhorz
        " use Monaco with no antialiasing
        set guifont=Monaco:h10
        set noantialias
        " maybe set the transparency
        "set transparency=2
    endif

endif

