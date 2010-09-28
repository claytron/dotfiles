" My vimrc uses folds
"
" zR    open all folds
" zM    close all folds
" za    toggle fold at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold

" My vimrc command and mapping quick reference                 {{{1
" -----------------------------------------------------------------
"
" The mapleader has been switched from '\' to ',' anytime you see
" <leader> that is what this refers to.
"
"    tt              -- opens up the taglist
"    <leader>h       -- toggles the highlight search
"    <leader>n       -- toggles the line numbers
"    <leader>a       -- starts an ack search in the CWD
"    <leader>f       -- shows the current file in the NERDTree. This
"                       is the TextMate equivalent of ctrl+cmd+r
"    <leader>T       -- Run tidy xml on the current file
"    <leader>i       -- toggles invisible characters
"    <leader>w       -- removes trailing whitespace characters
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
" Command line shortcuts
"
"    w!!             -- Save the following file using sudo to avoid
"                       the [readonly] flag
"
" I have set up some custom commands that might be of interest
"
"    MarkdownToHTML  -- Converts the current buffer into HTML and
"                       places it in a scratch buffer.
"    MarkdownToHTMLCopy -- Same as previous, but copies to clipboard
"    Shell           -- Runs a shell command and places it in the
"                       scratch buffer
"    TidyXML         -- Runs tidy in XML mode on the current buffer
"    TerminalHere    -- Opens the terminal to the directory of the
"                       current buffer

" General setting                                              {{{1
" -----------------------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" FreeBSD security advisory for this one...
set nomodeline

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" Set up pathogen
filetype off
call pathogen#runtime_append_all_bundles()

" set the mapleader key
let mapleader = ","
let g:mapleader = ","

" set the default encoding
set enc=utf-8

" set up jj as mode switch
map! jj <ESC>

" Take care of forgetting to use sudo with :w!!
cmap w!! w !sudo tee % > /dev/null

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

" have fifty lines of command-line (etc) history:
set history=1000

if has('mouse')
    " have the mouse enabled all the time
    set mouse=a
    " make a menu popup on right click
    set mousemodel=popup
endif

" allow for switching buffers when a file has changes
set hidden

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
set autoindent
set smartindent

" Allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Visual settings                                              {{{1
" -----------------------------------------------------------------

" tell the bell to go beep itself!
set visualbell t_vb=

" set the title of the window
set title
set titlestring=%f%(\ [%M]%)

" Ignore those annoying "hit enter to coninue" messages
" XXX there has to be a better way to accomplish this
set cmdheight=2

" Enhanced command menu ctrl + d to expand directories
set wildmenu
" comand <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
set wildignore+=*.pyc,*.pyo,CVS,.svn,.git,*.mo,.DS_Store,*.pt.cache,*.Python,*.o,*.lo,*.la,*~,.AppleDouble

map <silent> <leader>s :set spell!<CR>
set nospell

" This setting will cause the cursor to very briefly jump to a
" brace/parenthese/bracket's "match" whenever you type a closing or
" opening brace/parenthese/bracket.
set showmatch

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" Set a margin of lines when scrolling
set scrolloff=4
" lines to scroll when cursor leaves screen
set scrolljump=5

" set a custom status line similar to that of ":set ruler"
set statusline=\ \ \ \ \ line:%l\ column:%c\ \ \ %M%Y%r%=%-14.(%t%)\ %p%%
" show the statusline in all windows
set laststatus=2

" set all window splits equal
set equalalways

" highlight the cursor line
set cursorline

" turn on line numbers, aww yeah
set number
" shortcut to turn off line numbers
map <silent> <leader>n :set number!<CR>


" Pasting                                                      {{{1
" -----------------------------------------------------------------

" turn off smart indentation when pasting
set pastetoggle=<F2>
" shortcut for pasting clipboard contents
map <silent> <leader>* "+gP

" Searching                                                    {{{1
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
map <silent> <leader>h :set hlsearch!<CR>

" Shortcut to clear out the search pattern (and thus turn off the highlighting)
" from http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
map <silent> <leader>H :let @/ = ""<CR>

" Colors and Syntax                                            {{{1
" -----------------------------------------------------------------

" turn on syntax highlighting
syntax on

" highlight all python syntax
let python_highlight_all=1

" gui and terminal compatible color scheme
set t_Co=256
set background=dark
" set global variables that will define the colorscheme
let g:light_theme='mayansmoke'
let g:dark_theme='molokai'

" Use the "original" molokai theme colors instead of "dark"
let g:molokai_original=1

" Command to call the ColorSwitch funciton
command! -nargs=? -complete=customlist,s:completeColorSchemes ColorSwitcher :call s:colorSwitch(<q-args>)

" A function to toggle between light and dark colors
function! s:colorSwitch(...)
    " function to switch colorscheme
    function! ChangeMe(theme)
        execute('colorscheme '.a:theme)
        try
            execute('colorscheme '.a:theme.'_custom')
        catch /E185:/
            " There was no '_custom' scheme...
        endtry
    endfunction

    " Change to the specified theme
    if eval('a:1') != ""
        " check to see if we are passing in an existing var
        if exists(a:1)
            call ChangeMe(eval(a:1))
        else
            call ChangeMe(a:1)
        endif
        return
    endif

    " Toggle between a light and dark vim colorscheme
    if &background == 'dark'
        call ChangeMe(g:light_theme)
    elseif &background == 'light'
        call ChangeMe(g:dark_theme)
    endif
endfunction

" completion function for colorscheme names
function! s:completeColorSchemes(A,L,P)
    let colorscheme_names = []
    for i in split(globpath(&runtimepath, "colors/*.vim"), "\n")
        let colorscheme_name = fnamemodify(i, ":t:r")
        if stridx(colorscheme_name, "_custom") < 0
            call add(colorscheme_names, colorscheme_name)
        endif
    endfor
    return filter(colorscheme_names, 'v:val =~ "^' . a:A . '"')
endfunction

" set the colorscheme
ColorSwitcher g:dark_theme

" switch between light and dark colors
map <silent> <leader>c :ColorSwitcher<CR>

" Custom functions and commands                                {{{1
" -----------------------------------------------------------------

" Tabs and spaces                                              {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

" Set spaces by default
call Tabstyle_spaces()

" Shell as scratch buffer                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" function to run shell commands and create a scratch buffer (modified
" slightly so that it doesn't show the command and it's interpretation)
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" Example, show output of ls in a scratch buffer:
"
" :Shell ls -al

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = '"'.fnameescape(expand(part)).'"'
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

" Whitespace                                                   {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Call the strip trailing whitespace function as a command
command! StripTrailingWhitespaces call s:StripTrailingWhitespaces()

" A function to strip trailing whitespace and clean up afterwards so
" that the search history remains intact and cursor does not move.
" Taken from: http://vimcasts.org/episodes/tidying-whitespace
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

map <leader>w :StripTrailingWhitespaces<CR>

" Markdown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" run markdown on the current file and place the html in a scratch buffer
command! -nargs=0 MarkdownToHTML  call s:RunShellCommand('Markdown.pl %')
" replace the current buffer with the html version of the markdown
command! -nargs=0 MarkdownToHTMLReplace  %!Markdown.pl "%"
" copy the html version of the markdown to the clipboard (os x)
command! -nargs=0 MarkdownToHTMLCopy  !Markdown.pl "%" | pbcopy
" use pandoc to convert from html into markdown
command! -nargs=0 MarkdownFromHTML  %!pandoc -f html -t markdown "%"

" Tidy                                                         {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" xml tidy
command! -complete=file -nargs=* TidyXML call s:TidyXML()
map <leader>T :TidyXML<CR>

function! s:TidyXML()
    " Preparation: save last search, and cursor position.
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!tidy -xml -i -q -w 0
    " Clean up cursor position
    call cursor(l, c)
endfunction

" Plugins                                                      {{{1
" -----------------------------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on                " enables filetype detection
filetype plugin indent on  " enables filetype specific plugins

" NERDTree                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" set project folder to x
map <leader>x :NERDTreeToggle<CR>
map <leader>b :NERDTreeFromBookmark<Space>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
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
    \'\.\~lock.*#$',
    \'\.AppleDouble$',
    \'\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" when the root is changed, change Vim's working dir
let NERDTreeChDirMode=2

" Fuzzy Finder                                                 {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" max results, lot o' files in a buildout :)
let g:fuzzy_ceiling=35000
" show full paths
let g:fuzzy_path_display = 'highlighted_path'
" ignored files
let g:fuzzy_ignore = "*.png;*.PNG;*.pyc;*.pyo;*.JPG;*.jpg;*.GIF;*.gif;.svn/**;.git/**;*.mo;.DS_Store;.AppleDouble"
" available modes
let g:FuzzyFinderOptions = {
    \'File': {'mode_available': 1},
    \'Buffer': {'mode_available': 0},
    \'Dir': {'mode_available': 0},
    \'MruFile': {'mode_available': 0},
    \'MruCmd': {'mode_available': 0},
    \'Bookmark': {'mode_available': 0},
    \}
" Don't delete a full path when using backspace in file mode
let g:FuzzyFinderOptions.File.smart_bs = 0

" Shortcuts for opening fuzzy finder
nmap ,ff :FufFile<Space>
nmap ,t :FufFile<Space>
nmap ,ft :FufTag<Space>

" Ack                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" shortcut for ack search
map <leader>a :Ack<Space>

" Mini buf explorer                                            {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" buffer explorer ctrl + tabbing and single click
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" VCSCommand                                                   {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Delete buffers when i'm done with them in VCSCommand
let VCSCommandDeleteOnHide = 1

" Taglist                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" make the taglist show on the right side
let Tlist_Use_Right_Window = 1
" only show the current buffer, fold the rest
let Tlist_File_Fold_Auto_Close = 1
" show the name in the ctags list, helps with zope stuff :)
let tlist_xml_settings = 'zcml;n:name,g:profile,p:permission,h:handler,m:component,f:factory,c:class'
let tlist_cfg_settings = 'ini;s:section'
" mapping for taglist
nnoremap tt :TlistToggle<CR>

" CSV                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" turn on tsv in csv mode
function! Csv_tsv()
  let b:delimiter='\t'
  let b:col=substitute(b:col, ',', '\t', 'g')
endfunction

" Auto command settings                                        {{{1
" -----------------------------------------------------------------

if has("autocmd")
    " automatically re-source the vimrc on save
    "autocmd bufwritepost .vimrc source $MYVIMRC

    " automatically use the wiki text for trac.sixfeetup.com when
    " using it's all text
    au BufNewFile,BufRead *trac.sixfeetup.com.* set filetype=wiki
    " use markdown for karl
    au BufNewFile,BufRead *karl.sixfeetup.com.* set filetype=markdown

    " shell files
    au BufNewFile,BufRead .common* set filetype=sh

    " vim help files
    au BufNewFile,BufRead /*/doc/*.txt set filetype=help

    " Zope and Plone files
    " -----------------------------------------------------------------
    " xml syntax for zcml files
    au BufNewFile,BufRead *.zcml set filetype=xml
    " css.dtml as css
    au BufNewFile,BufRead *.css.dtml set filetype=css
    " kss files as css
    au BufNewFile,BufRead *.kss set filetype=css syntax=kss
    " js.dtml as javascript
    au BufNewFile,BufRead *.js.dtml set filetype=javascript
    " any txt file in a `tests` directory is a doctest
    au BufNewFile,BufRead /*/tests/*.txt set filetype=doctest

    " automatically give executable permissions if file begins with #! and contains
    " '/bin/' in the path
    " borrowed from: http://github.com/mitechie/pyvim/blob/1.0/vimrc#L259
    au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
endif

" Cursor and window controls                                   {{{1
" -----------------------------------------------------------------

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

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" turn on writeroom
map <silent> <F8> :source ~/.vim/nightroom.vim<CR>

" map ; to : so you don't have to use shift
map ; :

" Mapping window commands directly
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" set up the invisible characters
set listchars=tab:▸\ ,eol:¬
" show invisible characters by default
set list
" toggle invisible characters
noremap <silent> <leader>i :set list!<CR>

" GUI settings                                                 {{{1
" -----------------------------------------------------------------

" A dictionary of available sizes, inspired by Firesizer
let vs_window_sizes = {"normal": '155 45', "bigger": '215 50', "ginourmous": "285 65"}

" shortcuts to switch the window size
map <leader>1 :VSSelectWindowSize normal<CR>
map <leader>2 :VSSelectWindowSize bigger<CR>
map <leader>3 :VSSelectWindowSize ginourmous<CR>

if has("gui_running")

    " turn off the cursor blinking (who thinks that is a good idea?)
    set guicursor+=a:blinkon0

    if has("autocmd")
        " Default size of window
        autocmd VimEnter * exe 'VSSelectWindowSize bigger'

        " automagically open NERDTree in a GUI
        autocmd VimEnter * exe 'NERDTreeToggle' | wincmd l
        " close the NERDTree when opening it's all text and vimperator
        " editors
        autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/*,vimperator-*.tmp exe 'NERDTreeClose'
        autocmd VimEnter,BufNewFile,BufRead /*/itsalltext/* set nospell
        " Close the NERDTree when external editing emails
        autocmd VimEnter,BufNewFile,BufRead *.eml exe 'NERDTreeClose'
        " Close the NERDTree if we open a svn commit message
        autocmd VimEnter,BufNewFile,BufRead svn-{commit,prop}.*tmp exe 'NERDTreeClose'
        " Close the NERDTree if we open a git commit message
        autocmd VimEnter,BufNewFile,BufRead COMMIT_EDITMSG exe 'NERDTreeClose'
        " Close the NERDTree if we open a zsh command line
        autocmd VimEnter,BufNewFile,BufRead /*/tmp/zsh* exe 'NERDTreeClose'
    endif

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
        set transparency=2
    endif

endif

" turn on folds
" vim: fdm=marker
