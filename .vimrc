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
"    <leader>\       -- toggle line wrapping
"    <leader>y       -- show the yankring
"    <leader>x       -- toggles NERDTree drawer
"    <leader>b       -- shortcut for getting to NERDTree bookmarks
"    <leader>q       -- Toggle the quickfix window
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
"    TabStyle        -- Set the tab style and number, :TabStyle space 4

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
call pathogen#helptags()

" set the mapleader key
let mapleader = ","
let g:mapleader = ","

" set the default encoding
set enc=utf-8

" set up jj as mode switch
map! jj <ESC>

" Take care of forgetting to use sudo with :w!!
cmap w!! w !sudo tee % > /dev/null

" Set the shell to sh, zsh and vim don't seem to play nice
set shell=sh

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

if v:version >= 703
    " keep a persistent backup file
    set undofile
    set undodir=~/.backup/vim/undo,~/tmp,/tmp
endif

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
set autoindent
set smartindent

" Only one space after periods when formatting strings
set nojoinspaces

" Allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" open up my vimrc in a tab for modifications
map <leader>v :tabedit $MYVIMRC<CR>

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

" don't redraw during macros
set lazyredraw

" Set linebreak so words don't get split
set linebreak

" Scroll in smaller increments when going horizontal
set sidescroll=5

" Set the characters showing horizontal scrolling
set listchars+=precedes:←,extends:→

" toggle line wrapping on/off
map <silent> <leader>\ :set wrap!<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" always jump to the top of svn commit messages
au BufReadPost svn-commit*.tmp exe "normal! gg"

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

" Find any non-ascii character
map <silent> <leader>uni /[^ -~]<CR>

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
let g:light_theme='solarized'
let g:dark_theme='solarized'

" Use the "original" molokai theme colors instead of "dark"
let g:molokai_original=1

" Zenburn settings
let g:zenburn_alternate_Error = 1

" Solarized settings
let g:solarized_termcolors=16

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
    " This also takes care of the solarized scheme
    if &background == 'dark'
        set background=light
        call ChangeMe(g:light_theme)
    elseif &background == 'light'
        set background=dark
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

" command to switch tab styles
command! -nargs=+ TabStyle :call s:TabChanger(<f-args>)

" function to switch between tabs and spaces
" initial idea taken from:
" http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc
function! s:TabChanger(...)
    let l:tab_type = a:1
    if !exists('a:2')
        let l:tab_length = 4
    else
        let l:tab_length = a:2
    endif
    exec 'set softtabstop=' . l:tab_length
    exec 'set shiftwidth=' . l:tab_length
    exec 'set tabstop=' . l:tab_length
    if l:tab_type == "space"
        set expandtab
    elseif l:tab_type =="tab"
        set noexpandtab
    endif
endfunction

TabStyle space 4

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
map <silent> <leader>T :TidyXML<CR>

function! s:TidyXML()
    " Preparation: save last search, and cursor position.
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!tidy -xml -i -q -w 0
    " Clean up cursor position
    call cursor(l, c)
endfunction

" Quickfix                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

command! -bang -nargs=? QFix call QFixToggle(<bang>0)

" Function to toggle the quickfix window open and close
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

map <leader>q :QFix<CR>

" Copy search matches to register                              {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CopyMatches call s:CopyMatches(<line1>, <line2>, '<reg>')
function! s:CopyMatches(line1, line2, reg)
  let hits = []
  for line in range(a:line1, a:line2)
    let txt = getline(line)
    let idx = match(txt, @/)
    while idx >= 0
      let end = matchend(txt, @/, idx)
      if end > idx
    call add(hits, strpart(txt, idx, end-idx))
      else
    let end += 1
      endif
      if @/[0] == '^'
        break  " to avoid false hits
      endif
      let idx = match(txt, @/, end)
    endwhile
  endfor
  if len(hits) > 0
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  else
    echo 'No hits'
  endif
endfunction

" :global to buffer                                            {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Output the last global command to a buffer for further use
command! GlobalToBuffer execute 'normal! 0"ay0' | execute 'g//y A' | split | enew | setlocal bt=nofile | put! a

" Open a buffer number in a vertical split                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Vertical Split Buffer Function
function! VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer
endfunction

" Vertical Split Buffer Mapping
command! -nargs=1 Vbuffer call VerticalSplitBuffer(<f-args>)

" Plugins                                                      {{{1
" -----------------------------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on                " enables filetype detection
filetype plugin indent on  " enables filetype specific plugins

" Disable plugins                                              {{{2
"
" Uncomment the lines below to disable a particular plugin. This
" short circuits the plugin and stops it from loading.
" -----------------------------------------------------------------

" Ack                                                          {{{3
" XXX: has no trap

" BufOnly                                                      {{{3
" XXX: has no trap

" DelimitMate                                                  {{{3
"let g:loaded_delimitMate = 1

" FuzzyFinder and l9                                           {{{3
" XXX: I couldn't figure those out :)

" gundo                                                        {{{3
"let loaded_gundo = 1

" lodgeit                                                      {{{3
"let loaded_lodgeit = 1

" NERDTree                                                     {{{3
"let loaded_nerd_tree = 1

" minibufexplr                                                 {{{3
"let loaded_minibufexplorer = 1

" pyflakes                                                     {{{3
"let b:did_pyflakes_plugin = 1

" Python Matchit                                               {{{3
"let b:loaded_py_match = 1

" repeat                                                       {{{3
"let g:loaded_repeat = 1

" RevealExtends                                                {{{3
"let g:loaded_RevealExtends = 1

" Scratch                                                      {{{3
"let loaded_scratch=1

" Search complete                                              {{{3
"let loaded_search_complete = 1

" SnipMate                                                     {{{3
"let loaded_snips = 1

" Supertab                                                     {{{3
" XXX: has no specific trap

" surround                                                     {{{3
"let g:loaded_surround = 1

" syntastic                                                    {{{3
"let g:loaded_syntastic_plugin = 1

" Tabular                                                      {{{3
"let g:tabular_loaded = 1

" Taglist                                                      {{{3
"let loaded_taglist = 'yes'

" Tasklist                                                     {{{3
"let g:loaded_tasklist = 1

" VCSCommand                                                   {{{3
"let VCSCommandDisableAll = 1

" Solarized toggle background                                  {{{3
"let g:loaded_ToggleBackground = 1

" vimsizer                                                     {{{3
"let loaded_vimsizer = 1

" visualstar                                                   {{{3
"let g:loaded_visualstar = 1

" xmledit                                                      {{{3
"let loaded_xmledit = 1

" yankring                                                     {{{3
"let loaded_yankring = 1

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
nmap <leader>ff :FufFile<Space>**/
nmap <leader>t :FufCoverageFile<Space>
nmap <leader>ft :FufTag<Space>

" Ack                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" shortcut for ack search
map <leader>a :Ack!<Space>

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
let tlist_xml_settings = 'zcml;n:name,g:profile,p:permission,h:handler,m:component,f:factory,c:class,i:id,s:schema'
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

" Lodgeit                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:lodgeit_url = "https://paste.sixfeetup.com"
let g:lodgeit_username = "clayton"
let g:lodgeit_secure = 1

" Gundo                                                        {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>g :GundoToggle<CR>

" syntastic                                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable signs support to visually see where errors/warnings appear
let g:syntastic_enable_signs=1
" Automatically open the location list when there are errors
let g:syntastic_auto_loc_list=1

" Yankring                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Show and hide the yankring history
nnoremap <silent> <leader>y :YRShow<CR>
" Set the maximum number of history
let g:yankring_max_history = 200
" Make the yankring set the numbered registers
let g:yankring_manage_numbered_reg = 1

" Auto command settings                                        {{{1
" -----------------------------------------------------------------

if has("autocmd")
    " automatically re-source the vimrc on save
    autocmd bufwritepost .vimrc source $MYVIMRC

    " vimperator and pentadactyl files
    au BufNewFile,BufRead *.vimp,*.penta,.vimperatorrc,.pentadactylrc set filetype=vim

    " automatically use the wiki text for trac.sixfeetup.com when
    " using it's all text
    au BufNewFile,BufRead *trac.sixfeetup.com.* set filetype=wiki
    " use markdown for karl
    au BufNewFile,BufRead *karl.sixfeetup.com.* set filetype=markdown.html

    " shell files
    au BufNewFile,BufRead .common* set filetype=sh

    " vim help files
    au BufNewFile,BufRead /*/doc/*.txt set filetype=help

    " Zope and Plone files
    " -----------------------------------------------------------------
    " xml syntax for zcml files
    au BufNewFile,BufRead *.zcml set filetype=xml.zcml
    " css.dtml as css
    au BufNewFile,BufRead *.css.dtml set filetype=css.dtml
    " kss files as css
    au BufNewFile,BufRead *.kss set filetype=kss.css
    " js.dtml as javascript
    au BufNewFile,BufRead *.js.dtml set filetype=javascript.dtml
    " any txt file in a `tests` directory is a doctest
    au BufNewFile,BufRead /*/tests/*.txt set filetype=doctest.rst

    " automatically give executable permissions if file begins with #! and contains
    " Automatic `:!chmod +x %`.
    " taken from https://gist.github.com/791189
    autocmd BufWritePost * call s:auto_chmod()
    function! s:auto_chmod()
        if !exists('b:disable_auto_chmod')
        \ && getfperm(expand('%'))[2] !=# 'x'
        \ && getline(1) =~# '^#!'
            !chmod +x %
        endif
    endfunction
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

" sort versions in a versions.cfg
map <leader>V /\[versions\]<CR>jVG:g/^#/d<CR>gv:g/^$/d<CR>gv:sort i<CR>

" GUI settings                                                 {{{1
" -----------------------------------------------------------------

" A dictionary of available sizes, inspired by Firesizer
let vs_window_sizes = {"normal": '155 45', "bigger": '215 50', "ginourmous": "285 65", "1280screen": "200 65"}

" shortcuts to switch the window size
map <leader>1 :VSSelectWindowSize normal<CR>
map <leader>2 :VSSelectWindowSize bigger<CR>
map <leader>3 :VSSelectWindowSize ginourmous<CR>
map <leader>4 :VSSelectWindowSize 1280screen<CR>

if has("gui_running")

    " turn off the cursor blinking (who thinks that is a good idea?)
    set guicursor+=a:blinkon0

    if has("autocmd")
        " Default size of window
        "autocmd VimEnter * exe 'VSSelectWindowSize bigger'

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
        set guifont=Inconsolata-dz:h10,Inconsolata:h12,Monaco:h10
        set antialias
        " maybe set the transparency
        set transparency=2

        " turn off transparency
        noremap <leader>TT :set transparency=0<CR>
    endif

    if has("gui_gtk2")
        set guifont=Inconsolata\ Medium\ 10,Droid\ Sans\ Mono\ 9,Liberation\ Mono\ 10,LucidaTypewriter\ Medium\ 10,Terminal
        autocmd GUIEnter * set vb t_vb=
    endif
endif

" turn on folds
" vim: fdm=marker
