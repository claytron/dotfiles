" My vimrc uses folds
"
" zi    toggle all folds (open or closed)
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
" Change Option mnemonic                                       {{{2
" -----------------------------------------------------------------
"    coc             -- Switch between light and dark colors
"    coe             -- Show current :Errors
"    cog             -- Toggle the gutter and clear signs
"    coh             -- Clear the current search highlight
"    coH             -- Toggles the highlight search
"    coi             -- Toggles invisible characters
"    col             -- Toggles the location list
"    con             -- Toggles the line numbers
"    conn            -- Toggles relative line numbers
"    coq             -- Toggle the quickfix window
"    cos             -- Toggle spell checking
"    cot             -- Change the tab name
"    cov             -- Edit the current user's vimrc
"    cow             -- Toggle line wrapping
"    cox             -- Toggles NERDTree drawer
"
" Clean Up mnemonic                                            {{{2
" -----------------------------------------------------------------
"    cuw             -- Removes trailing whitespace characters
"    cuf             -- Clean up the current file using autoformat
"    cut             -- Find things to clean up. TODO, XXX, etc.
"    cuv             -- Sort a buildout versions.cfg file
"
" File Type mnemonic                                           {{{2
" -----------------------------------------------------------------
"    ftc             -- Change current filetype to CSS
"    fth             -- Change current filetype to HTML
"    ftj             -- Change current filetype to Javascript
"    ftm             -- Change current filetype to Markdown
"    ftp             -- Change current filetype to Python
"    ftr             -- Change current filetype to reStructuredText
"    ftv             -- Change current filetype to Vim
"    ftw             -- Change current filetype to Wiki
"
" TeSt mnemonic
" -----------------------------------------------------------------
"    tsl             -- :TestNearest
"    ts;             -- :TestFile
"    ts'             -- :TestSuite
"    tss             -- :TestLast
"
" Fuzzy Finder mnemonic                                        {{{2
" -----------------------------------------------------------------
"    ff              -- Fuzzy file mode
"    fft             -- Fuzzy tag mode
"    ffr             -- Fuzzy MRU mode
"    ffe             -- Fuzzy buffer mode
"    ffc             -- Fuzzy :colors mode
"
" Tell Me mnemonic                                             {{{2
" -----------------------------------------------------------------
"    tma             -- Starts an ack search in the CWD
"    tmf             -- Shows the current file in the NERDTree. This
"                       is the TextMate equivalent of ctrl+cmd+r
"    tmi             -- Toggle indent guides
"    tmy             -- Show the yankring
"    tmb             -- Shortcut for getting to NERDTree bookmarks
"    tm1             -- Set a highlight for the current word (1)
"    tm2             -- Set a highlight for the current word (2)
"    tm3             -- Set a highlight for the current word (3)
"    tmr             -- Show me reST preview
"    tmrk            -- Stop reST preview
"    tmm             -- Show me Markdown preview
"    tmmk            -- Stop Markdown preview
"    tms             -- Save the file
"    tmg             -- Toggle signify folds (show only vcs changes)
"    tmt             -- Show translations for the current key (rails)
"    tmte            -- Expand the current YAML key (rails)
"
" Git stuff                                                    {{{2
" -----------------------------------------------------------------
"    tgg             -- Git status (tmg was too hard, so tg)
"    //              -- Git grep (double tap to start)
"    tgd             -- Git diff
"    tgb             -- Git blame
"    tgl             -- Git log on the current file (back 100)
"    tgll            -- Git log on the current project (back 100)
"    tgh             -- Git log search looking for + / - of term
"    tghh            -- Git log search with word in diff
"
" Window Management                                            {{{2
" -----------------------------------------------------------------
"    <C-W>-          -- Horizontal split
"    <C-W>|          -- Vertical split
"    <C-W>z          -- Zoom in on the current buffer
"    <C-W><C-E>      -- Cycle through windows
"    <C-H>           -- Move left to window
"    <C-J>           -- Move up to window
"    <C-K>           -- Move down to window
"    <C-L>           -- Move right to window
"    <C-W><C-H>      -- Move left to next tab
"    <C-W><C-L>      -- Move right to next tab
"    <C-W><C-N>      -- Create a new tab
"    <C-W><C-I>      -- Edit current file in a new tab
"    <C-W><C-X>      -- Close the current tab
"    +               -- Make the current window taller
"    -               -- Make the current window shorter
"
" Other random stuff                                           {{{2
" -----------------------------------------------------------------
"    ]q              -- Previous quickfix change
"    [q              -- Next quickfix change
"    ]w              -- Previous location list change
"    [w              -- Next location list change
"    tt              -- Opens up the taglist
"    Y               -- Yank to the end of the line, no newline
"    YY              -- Yank the current line, no newline
"    funi            -- Find the next non-ascii character (funny)
"    jj              -- Alternative to <ESC>
"    jk              -- Alternative to <ESC>
"    <leader>Enter   -- Split line at current cursor in normal mode
"    <F2>            -- Toggle smart indent on paste
"
" Command line mappings                                        {{{2
" -----------------------------------------------------------------
"
"    <C-a>           -- Beginning of the line
"    <C-c>           -- End of the line
"
" Custom Commands                                              {{{2
" -----------------------------------------------------------------
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
"    W               -- Save the following file using sudo to avoid
"                       the [readonly] flag.

" General setting                                              {{{1
" -----------------------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set modeline

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" Load up all vim plugins
source ~/.vim_plugins.vim

" set the mapleader key
let mapleader = ","
let g:mapleader = ","

" Set a shorter timeout length to make jk and jj easier to use
set timeoutlen=350

" set the default encoding
if !has('nvim')
  set enc=utf-8
endif

" only increment numbers and letters
set nrformats=""

" set up jj as mode switch
map! jj <ESC>
map! jk <ESC>

" Save shortcut
nnoremap tms :w<CR>

" Set the shell to bash, zsh and vim don't seem to play nice
set shell=$SHELL

" :terminal settings
let g:terminal_scrollback_buffer_size=100000

" Python support via virtualenvs
let g:python_host_prog = expand('~/.virtualenvs/neovim-py2/bin/python', ':p')
let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python', ':p')

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

if v:version >= 703
    " keep a persistent backup file
    set undofile
    set undodir=~/.backup/vim/undo,~/tmp,/tmp
endif

" have fifty lines of command-line (etc.) history:
set history=10000

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

" Use the clipboard
set clipboard^=unnamed,unnamedplus

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
map cov :tabedit $MYVIMRC<CR>

" Highlight the word under the cursor
" Taken from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> tm1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> tm2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> tm3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" Re-initialize interesting words to select different ones.
nnoremap <silent> tm0 :ExtraHighlightsInit<cr>


" shortcut to cycle through quickfix list
nnoremap [q :cnext<cr>
nnoremap ]q :cprevious<cr>

" shortcut to cycle through location list
nnoremap [w :lnext<cr>
nnoremap ]w :lprevious<cr>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v
nnoremap //// :tab helpg \v\c<Left><Left>

" Easy filetype switching
nnoremap ftm :set ft=markdown<CR>
nnoremap ftp :set ft=python<CR>
nnoremap ftw :set ft=wiki<CR>
nnoremap ftr :set ft=ruby<CR>
nnoremap ftrs :set ft=rst<CR>
nnoremap ftv :set ft=vim<CR>
nnoremap ftj :set ft=javascript<CR>
nnoremap fts :set ft=sql<CR>
nnoremap ftsh :set ft=sh<CR>
nnoremap ftc :set ft=css<CR>
nnoremap fth :set ft=html<CR>

" Visual settings                                              {{{1
" -----------------------------------------------------------------

" tell the bell to go beep itself!
set visualbell t_vb=

" set the title of the window
set title
set titlestring=%f%(\ [%M]%)

" Enhanced command menu ctrl + d to expand directories
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
" Ignore case when tab completing
set wildignorecase
set wildignore+=*.pyc,*.pyo,CVS,.svn,.git,*.mo,.DS_Store,*.pt.cache,*.Python,*.o,*.lo,*.la,*~,.AppleDouble,*/blobstorage/*,*/Paste*-*.egg/*

map <silent> cos :set spell!<CR>
if version >= 700
  set spl=en spell
endif
set spell

" This setting will cause the cursor to very briefly jump to a
" brace/parentheses/bracket's "match" whenever you type a closing or
" opening brace/parentheses/bracket.
set showmatch

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" Set a margin of lines when scrolling
set scrolloff=4
" lines to scroll when cursor leaves screen
set scrolljump=0

" show the statusline in all windows
set laststatus=2

" set all window splits equal
set equalalways

" more natural split direction
set splitbelow
set splitright

" highlight the cursor line
set cursorline

" turn on line numbers, aww yeah
set number
" shortcut to turn off line numbers
map <silent> con :set number!<CR>
" toggle relative number
map <silent> conn :set relativenumber!<CR>

" don't redraw during macros
set lazyredraw

" Set linebreak so words don't get split
set linebreak

" Scroll in smaller increments when going horizontal
set sidescroll=5

" toggle line wrapping on/off
map <silent> cow :set wrap!<CR>

augroup PreservingFilePosition
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " always jump to the top of commit messages
  " NOTE: mercurial and bazaar use temporary files, so this isn't necessary
  autocmd BufReadPost svn-commit*.tmp exe "normal! gg"
  autocmd BufReadPost COMMIT_EDITMSG* exe "normal! gg"
augroup END

" Borrowed from
" http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()

" Pasting                                                      {{{1
" -----------------------------------------------------------------

" turn off smart indentation when pasting
set pastetoggle=<F2>

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
map <silent> coH :set hlsearch!<CR>

" Shortcut to clear out the search pattern (and thus turn off the highlighting)
" from http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
map <silent> coh :let @/ = ""<CR>

" Find any non-ascii character
map <silent> funi /[^ -~]<CR>

" Colors and Syntax                                            {{{1
" -----------------------------------------------------------------

" turn on syntax highlighting
syntax on

" highlight all python syntax
let python_highlight_all=1

" gui and terminal compatible color scheme
set t_Co=256
set background=dark

" Use the "original" molokai theme colors instead of "dark"
let g:molokai_original=1

" Zenburn settings
let g:zenburn_alternate_Error = 1

" Solarized settings
let g:solarized_termcolors=16
let g:solarized_diffmode='high'
let g:neosolarized_termtrans=1

" Function to quickly apply and reset custom highlights
function! s:extraHighlights()
    " Syntax highlights for the mappings set above
    hi InterestingWord1 guifg=#eee8d5 guibg=#FF4300 ctermfg=254 ctermbg=166
    hi InterestingWord2 guifg=#eee8d5 guibg=#859900 ctermfg=254 ctermbg=64
    hi InterestingWord3 guifg=#eee8d5 guibg=#268bd2 ctermfg=254 ctermbg=33

    " Setting the highlight for the IndentGuides function above
    hi IndentGuides                   guibg=#373737            ctermbg=237
    match none
    2match none
    3match none

    " Set comments to italic to use the power of Operator Mono
    hi Comment cterm=italic
endfunction

command! ExtraHighlightsInit :call s:extraHighlights()

" A function to toggle between light and dark colors, or switch to
" the given theme.
function! s:colorSwitch(...)
    " Change to the specified theme, if there were args
    if eval('a:1') != ""
        " check to see if we are passing in an existing var
        if exists(a:1)
            execute('colorscheme '.eval(a:1))
        else
            execute('colorscheme '.a:1)
        endif
        " Put the extra highlights back in place
        call s:extraHighlights()
        return
    endif

    " Toggle between a light and dark vim colorscheme
    " This also takes care of the solarized scheme
    if &background == 'dark'
        set background=light
    elseif &background == 'light'
        set background=dark
    endif

    " Put the extra highlights back in place
    call s:extraHighlights()
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

" Command to call the ColorSwitch function
command! -nargs=? -complete=customlist,s:completeColorSchemes ColorSwitcher :call s:colorSwitch(<q-args>)

" switch between light and dark colors
map <silent> coc :ColorSwitcher<CR>

" set the colorscheme
ColorSwitcher NeoSolarized

" Toggle the gutter
function! s:toggleGutterSigns()
  if &signcolumn =~ '\v(auto|yes)'
    set signcolumn=no
  else
    set signcolumn=auto
  endif
endfunction

command! ToggleGutterSigns :call s:toggleGutterSigns()

" Toggle the gutter on and off
map <silent> cog :ToggleGutterSigns<cr>

" Custom functions and commands                                {{{1
" -----------------------------------------------------------------

" Strip whitespace                                             {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Taken from here:
" https://vi.stackexchange.com/a/456/5433
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
nnoremap <silent> cuw :TrimWhitespace<cr>

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

TabStyle space 2

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

" Markdown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" run markdown on the current file and place the html in a scratch buffer
command! -nargs=0 MarkdownToHTML  call s:RunShellCommand('Markdown.pl %')
" replace the current buffer with the html version of the markdown
command! -nargs=0 MarkdownToHTMLReplace  %!Markdown.pl "%"
" copy the html version of the markdown to the clipboard
command! -nargs=0 MarkdownToHTMLCopy  !Markdown.pl "%" | clipboard
" use pandoc to convert from html into markdown
command! -nargs=0 MarkdownFromHTML  %!pandoc -f html -t markdown_github "%"

" Quickfix                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Borrowed from
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> coq :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> col :call ToggleList("Location List", 'l')<CR>

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
command! GlobalToBuffer execute 'normal! 0"ay0' | execute 'g//y A' | split | enew | setlocal bt=nofile | put! a | execute 'normal! ggddGdd'

" Open a buffer number in a vertical split                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Vertical Split Buffer Function
function! VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer
endfunction

" Vertical Split Buffer Mapping
command! -nargs=1 Vbuffer call VerticalSplitBuffer(<f-args>)

" Show indent guides                                           {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Taken from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" though that may not be the originator.
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
nnoremap <silent> tmi :call IndentGuides()<cr>

" Save a file with sudo when it is [readonly]                  {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Taken from command line fu.
" http://www.commandlinefu.com/commands/view/9425
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Git Commit Dance                                             {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! GitCommitDance()
    " Disable scrolloff
    set scrolloff=0
    " Find the last line of the git file list / first line before diff
    execute "normal G?^#\<CR>"
    let curline=line('.')
    " Split the window so we can see the diff and the commit message
    split
    " show only the git message on top, set it to that height
    execute "normal ggz". curline ."\<CR>"
    " Start the diff window at the top of the diff
    execute "normal \<C-W>j". curline ."Gjz\<CR>"
    " Go back to the commit editing
    execute "normal \<C-W>k"
endfunction

" Open help in a tab                                           {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" via http://stackoverflow.com/a/7515418/34530
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
cnoreabbrev <expr> helpg getcmdtype() == ":" && getcmdline() == 'helpg' ? 'tab helpg' : 'helpg'

" Search i18n-tasks for a string                               {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function! s:I18nTasksFind(...)
  " TODO: Check for bundle or the command itself
  execute("setlocal makeprg=bundle\\ exec\\ i18n-tasks\\ find\\ '". a:1 ."'")
  " TODO: Handle the multi-line format properly
  setlocal errorformat=\ \ %f:%l\ %m
  " TODO: Make this async...
  silent make
  copen
endfunction

command! -nargs=1 I18nTasksFind :call s:I18nTasksFind(<q-args>)

" Plugins                                                      {{{1
" -----------------------------------------------------------------

" turn on filetype checking for plugins like pyflakes
filetype on                " enables filetype detection
filetype plugin indent on  " enables filetype specific plugins

" Grepper                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
map /// :Grepper -tool rg<cr>
map // :Grepper -tool git<cr>
map cut :Grepper -tool branchd -highlight -query '\b(TODO\|XXX\|HACK\|FIXME\|NOTE)\b'<cr>

" initialize g:grepper with defaults
runtime plugin/grepper.vim

" Available list of grepping tools
let g:grepper.tools = ['rg', 'git', 'giti', 'grep', 'branch', 'branchd']
" Modify git args to be case insensitive
let g:grepper.git.grepprg = 'git grep -nEIi'
" Case sensitive search is good sometimes though
let g:grepper.giti = {
  \ 'grepprg':    'git grep -nEI',
  \ 'grepformat': '%f:%l:%m',
  \ }
" Search across files modified in the current branch against master / dev
let g:grepper.branch = {
  \ 'grepprg':    "git grep -nE $* -- `git diff --name-only origin/master...`",
  \ 'grepformat': '%f:%l:%m',
  \ }
let g:grepper.branchd = {
  \ 'grepprg':    "git grep -nE $* -- `git diff --name-only origin/dev...`",
  \ 'grepformat': '%f:%l:%m',
  \ }

" Highlight matches
let g:grepper.highlight = 1
" Don't open and switch to the Quickfix window, manually open it
let g:grepper.open = 0

" CSV                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" turn on tsv in csv mode
function! Csv_tsv()
  let b:delimiter='\t'
  let b:col=substitute(b:col, ',', '\t', 'g')
endfunction

" NERDTree                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" set project folder to x
map cox :NERDTreeToggle<CR>
map tmb :NERDTreeFromBookmark<Space>
nnoremap <silent> tmf :NERDTreeFind<CR>
" files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
let NERDTreeIgnore=[
    \'\~$',
    \'\.pt.cache$',
    \'\.Python$',
    \'\.svn$',
    \'\.git*$',
    \'\.pyc$',
    \'__pycache__$',
    \'\.pyo$',
    \'\.mo$',
    \'\.o$',
    \'\.lo$',
    \'\.la$',
    \'\..*.rej$',
    \'\.rej$',
    \'\.\~lock.*#$',
    \'tndrbox_Images.*gif.*',
    \'tndrbox_.*[Ll]ogo.*',
    \'\.AppleDouble$',
    \'\.pt.py$',
    \'\.DS_Store$']
" set the sort order to alphabetical
let NERDTreeSortOrder=[]
" when the root is changed, change Vim's working dir
let NERDTreeChDirMode=2
" use fancy ass arrows
let NERDTreeDirArrows=1

" php debugger                                                 {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" turn off the mini buf explorer when using the debugger so the
" windows get initialized properly
let g:debuggerMiniBufExpl = 1

" Airline                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline_theme='base16_grayscale'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z='%4l/%-4L|%-3c'

" Tagbar                                                       {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap tt :TagbarToggle<CR>

" unset the sort so it sorts by source file order
let g:tagbar_sort = 0

" always jump into the tagbar pane when it is opened
let g:tagbar_autofocus = 1

" ZCML type
" XXX: This doesn't currently work because I use a filetype setting
"      of "xml.zcml".
let g:tagbar_type_zcml = {
    \ 'ctagstype': 'zcml',
    \ 'kinds': [
        \ 'n:name',
        \ 'f:for',
        \ 'g:profile',
        \ 'p:permission',
        \ 'p:provides',
        \ 'h:handler',
        \ 'm:component',
        \ 'f:factory',
        \ 'c:class',
        \ 'i:id',
        \ 'v:view',
        \ 's:schema',
        \ 'c:controller',
        \ 't:type',
        \ 'w:workflow'
    \ ]
\}
" cfg file type
let g:tagbar_type_cfg = {
    \ 'ctagstype': 'ini',
    \ 'kinds': ['s:section']
\ }
" Markdown type
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'kinds': [
          \ '1:header1',
          \ '2:header2',
          \ '3:header3',
          \ '4:header4',
          \ '5:header5',
          \ '6:header6',
          \ '7:header7'
    \ ]
\ }

let g:tagbar_type_yaml = {
    \ 'ctagstype': 'yaml',
    \ 'kinds': [
          \ 'd:definition',
          \ 'n:name'
    \ ]
\ }

let g:tagbar_type_sls = {
    \ 'ctagstype': 'yaml',
    \ 'kinds': [
          \ 'd:definition',
          \ 'n:name'
    \ ]
\ }

" yankstack                                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:yankstack_map_keys = 0
imap <C-f> <Plug>yankstack_substitute_older_paste
imap <C-g> <Plug>yankstack_substitute_newer_paste
nnoremap <silent> tmy :Yanks<CR>

" Signify                                                      {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Only show these VCS differences
let g:signify_vcs_list = ['git', 'hg', 'svn']

" Toggle signify folds
nmap <silent> tmg :SignifyFold!<CR>

" Markdown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:vim_markdown_folding_disabled=1

" Riv                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
augroup RivExpandFolds
  autocmd!

  " Auto open folds on file open
  " Couldn't figure out how to do this with the available riv options
  autocmd BufReadPost *.rst :normal zR
  " Manually decide when to break a line based on grammar
  autocmd BufReadPost *.rst :set textwidth=0
augroup END

" livedown                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap tmm :LivedownPreview<CR>
nmap tmmk :LivedownKill<CR>

" instant-rst                                                  {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap tmr :InstantRst<CR>
nmap tmrk :StopInstantRst<CR>

" Taboo                                                        {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Set the tab formats
let g:taboo_tab_format=" (%N.%W) %f%m "
let g:taboo_renamed_tab_format=" (%N.%W) %l%m "

" Set the modified flag
let g:taboo_modified_tab_flag="+"

" Mapping to quickly rename a tab
map cot :TabooRename<Space>

" Javascript                                                   {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:javascript_enable_domhtmlcss = 1

" fzf                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap ff :GFiles<CR>
" Show files changed on the current branch compared to master
nmap ffd :call fzf#run(fzf#wrap({'source': 'git diff --name-only `git merge-base HEAD origin/master`..HEAD \| sort -rf', 'options': '-m --prompt "GitChanged> " --preview "git diff --color=always master {}"'}))<CR>
nmap ffa :Files<CR>
nmap fft :Tags<CR>
nmap ffe :Buffers<CR>
nmap ffb :Buffers<CR>
nmap ffc :Colors<CR>
nmap ffr :MRUFilesCWD<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

" MRU handling, limited to current directory
command! MRUFilesCWD call fzf#run({
\  'source':  s:mru_files_for_cwd(),
\  'sink':    'edit',
\  'options': '-m -x +s --prompt=MRU:'.shellescape(pathshorten(getcwd())).'/',
\  'down':    '40%' })

" This relies on the yegappan/mru plugin for live MRU updating
function! s:mru_files_for_cwd()
  return map(filter(
  \  systemlist("sed -n '2,$p' ~/.vim_mru_files"),
  \  "v:val =~ '^" . getcwd() . "' && v:val !~ '__Tagbar__\\|\\[YankRing]\\|fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"
  \ ), 'fnamemodify(v:val, ":p:.")')
endfunction

" fugitive                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nmap tgg :Gstatus<CR>

nmap tgd :Gdiff<CR>

nmap tgb :Gblame<CR>

" Navigate through historical diffs
nmap tgl :Glog -100 -- %<CR>
nmap tgll :Glog -100 --<CR>

" History of additions / removals of the search word in diffs
" In the current file:
nmap tgh :Glog --pickaxe-regex -S -- %<Left><Left><Left><Left><Left>
" Across all files:
nmap tghh :Glog --pickaxe-regex -S --<Left><Left><Left>

" Search log messages
nmap tgs :Glog --grep<space>
" Search for occurrences of the search word in diffs
nmap tgss :Glog -G

" Tmuxline                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Add the current window flag
let g:tmuxline_preset = {
    \'a': '#S',
    \'win': ['#I#F', '#W'],
    \'cwin': ['#I#F', '#W'],
    \'y': ['%Y-%m-%d', '%H:%M'],
    \'z': '#h',
    \'options' : {'status-justify' : 'left'},
    \}

" vim-test                                                     {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('nvim')
  let test#strategy = "neovim"

  " All that madness at the end is to get out of :terminal and back to
  " the file we started in
  noremap tsl :TestNearest<CR>
  noremap ts; :TestFile<CR>
  noremap ts' :TestSuite<CR>
  noremap tss :TestLast<CR>
else
  if version >= 801
    let test#strategy = "vimterminal"
  endif
  noremap tsl :TestNearest<CR>
  noremap ts; :TestFile<CR>
  noremap ts' :TestSuite<CR>
  noremap tss :TestLast<CR>
endif

" Ignore deprecation warnings so I can see the results
let test#ruby#rspec#options = '--deprecation-out /dev/null'

" Typical python testing setup
let test#python#runner = 'pytest'
let test#python#pytest#executable = './env/bin/pytest -s'

" localorie                                                    {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <silent> tmt :call localorie#translate()<CR>
nnoremap <silent> tmte :call localorie#expand_key()<CR>

" python-syntax                                                {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:python_highlight_all=1

" vim-commentary                                               {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Unknown to the plugin
autocmd FileType xdefaults setlocal commentstring=\!\ %s
" It was preferring the erb style, so forcing yaml comment here
autocmd FileType eruby.yaml setlocal commentstring=#\ %s
" Apache config
autocmd FileType apache setlocal commentstring=#%s
" sql style
autocmd FileType sql setlocal commentstring=--\ %s

" vim-remembrall                                               {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Shows the commands for the mappings
nnoremap <silent> <expr> co Remembrall('co')
nnoremap <silent> <expr> cu Remembrall('cu')
nnoremap <silent> <expr> ft Remembrall('ft')
nnoremap <silent> <expr> tm Remembrall('tm')
nnoremap <silent> <expr> tg Remembrall('tg')
nnoremap <silent> <expr> , Remembrall(',')

" OmniSharp-vim                                                {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1

" vim-go                                                       {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" run commands in a re-usable terminal window
let g:go_term_mode = "10split"
let g:go_term_enabled = 1
let g:go_term_reuse = 1

" coc                                                          {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-emoji',
  \ 'coc-eslint',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-tag',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
\ ]

" Show errors list
nnoremap <silent> coe :CocDiagnostics<CR>

" Fix up the current file
nnoremap <silent> cuf :call CocAction('format')<CR>

" Auto command settings                                        {{{1
" -----------------------------------------------------------------

if has("autocmd")
  augroup FileTypes
    autocmd!

    " Turn off spelling for quickfix
    autocmd WinEnter * if &buftype == 'quickfix' | setlocal nospell | endif

    " automatically re-source the vimrc on save
    autocmd bufwritepost .vimrc source $MYVIMRC

    " jinja syntax automagically
    autocmd BufNewFile,BufRead *.jinja set filetype=jinja

    " vimperator and pentadactyl files
    autocmd BufNewFile,BufRead *.vimp,*.penta,.vimperatorrc,.pentadactylrc set filetype=vim

    " vim pager settings"
    autocmd BufNewFile,BufRead .vimpagerrc set filetype=vim

    " anything with the wiki extension should be treated as such
    autocmd BufNewFile,BufRead *.wiki set filetype=wiki

    " shell files
    autocmd BufNewFile,BufRead .common* set filetype=sh

    " vim help files
    autocmd BufNewFile,BufRead /*/doc/*.txt set filetype=help

    " Vagrant files
    autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

    " csvbuilder files in rails
    autocmd BufNewFile,BufRead *.csvbuilder set filetype=ruby

    " Pry config is ruby
    autocmd BufNewFile,BufRead .pryrc set filetype=ruby

    " ERD config is yaml
    autocmd BufNewFile,BufRead .erdconfig set filetype=yaml

    " psql sessions in Postgres
    autocmd BufNewFile,BufRead psql.edit.* set filetype=sql

    " Set up a split window for git verbose commit
    "autocmd BufNewFile,BufRead COMMIT_EDITMSG call GitCommitDance()

    " Turn off folding in git windows
    autocmd Syntax git setlocal nofoldenable

    if has('nvim')
      " Don't show invisibles in the terminal. Also go into insert mode.
      autocmd TermOpen * setlocal nolist
      autocmd TermOpen * startinsert
      " Go back to normal mode in the terminal once process is
      " complete, this stops the any key to close behavior.
      autocmd TermClose * call feedkeys("\<C-\>\<C-n>")
    endif

    " Zope and Plone files
    " -----------------------------------------------------------------
    " set up zope page templates as the zpt filetype
    autocmd BufNewFile,BufRead *.pt,*.cpt,*.zpt set filetype=zpt syntax=xml
    " xml syntax for zcml files
    autocmd BufNewFile,BufRead *.zcml set filetype=zcml syntax=xml
    " css.dtml as css
    autocmd BufNewFile,BufRead *.css.dtml set filetype=css.dtml
    " kss files as css
    autocmd BufNewFile,BufRead *.kss set filetype=kss.css
    " js.dtml as javascript
    autocmd BufNewFile,BufRead *.js.dtml set filetype=javascript.dtml
    " any txt file in a `tests` directory is a doctest
    autocmd BufNewFile,BufRead /*/tests/*.txt set filetype=doctest.rst

    " Chef and foodcritic
    autocmd BufNewFile,BufRead /*/cookbooks/*.rb set filetype=ruby.chef
    autocmd BufNewFile,BufRead /*/cookbooks/*.erb set filetype=eruby.chef
    autocmd BufNewFile,BufRead /*/cookbooks/*.yml set filetype=yaml.chef

    " Proselint
    autocmd BufNewFile,BufRead .proselintrc set filetype=json

    " i3
    autocmd BufNewFile,BufRead /*/.i3/config set filetype=i3config

    " Dynamics CRM WebResources
    autocmd BufNewFile,BufRead *css[0-9a-zA-Z]\\\{8\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{12\} set filetype=css
    autocmd BufNewFile,BufRead *js[0-9a-zA-Z]\\\{8\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{12\} set filetype=javascript
    autocmd BufNewFile,BufRead *html[0-9a-zA-Z]\\\{8\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{4\}-[0-9a-zA-Z]\\\{12\} set filetype=html
  augroup END
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
  nnoremap + <C-W>+
  nnoremap - <C-W>-
endif

" open a new line from the current spot (sort of the opposite of J)
map <leader><Enter> i<CR><ESC>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y yg_
" Yank an entire line without the line ending and leading space
nnoremap YY ^yg_

" sort versions in a versions.cfg
map cuv /\[versions\]<CR>jVG:g/^#/d<CR>gv:g/^$/d<CR>gv:sort i<CR>:w<CR>

" Set the fill characters so they aren't annoying
set fillchars=vert:┃,diff:·,fold:·

" set up the invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:›,precedes:‹

" show invisible characters by default
set list
" toggle invisible characters
noremap <silent> coi :set list!<CR>

" Window management settings                                   {{{1
" -----------------------------------------------------------------
" Mapping window commands directly
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Move between tabs
map <silent> <C-W><C-L> :tabnext<CR>
map <silent> <C-W><C-H> :tabprevious<CR>
map <silent> <C-W><C-N> :tabnext<CR>
map <silent> <C-W><C-P> :tabprevious<CR>

" Create a new tab
map <silent> <C-W><C-T> :tabnew<CR>
" Edit current buffer in a tab (think tmux zoom)
map <silent> <C-W><C-I> :tabedit %<CR>
" Close the current tab
map <silent> <C-W><C-X> :tabclose<CR>

" cycle windows
map <C-W>e <C-W>W
map <C-W><C-E> <C-W>W

" Window splits like I have mapped in tmux (- horizontal, | vertical)
map <C-W>- <C-W>s
map <C-W>\| <C-W>v
" Zoom like in tmux too
map <C-W>z <C-w>o

" Deal with neovim terminals and window movement
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-h>
  tnoremap <C-j> <C-\><C-n><C-j>
  tnoremap <C-k> <C-\><C-n><C-k>
  tnoremap <C-l> <C-\><C-n><C-l>
endif

" GUI settings                                                 {{{1
" -----------------------------------------------------------------

" A dictionary of available sizes, inspired by Firesizer
let vs_window_sizes = {"normal": '155 45', "bigger": '205 60', "ginourmous": "285 65", "1280screen": "200 65", "bigandtall": "227 75"}

" shortcuts to switch the window size
map <leader>1 :VSSelectWindowSize normal<CR>
map <leader>2 :VSSelectWindowSize bigger<CR>
map <leader>3 :VSSelectWindowSize ginourmous<CR>
map <leader>4 :VSSelectWindowSize 1280screen<CR>
map <leader>5 :VSSelectWindowSize bigandtall<CR>

if has('nvim')
    " Temporary fix for neovim/neovim#2048
    " Shoutout to @vilhalmer for the idea for this fix
    " https://github.com/vilhalmer/System/commit/a40ff262918a83e88fb643bad31dde3c45211bba
    "
    " Fix for window movement
    nmap <bs> <C-w>h
    " Fix for tab movement
    nmap <C-w><bs> :tabprevious<CR>
endif

if has("gui_running")
    " One more time here to match the terminal for some reason...
    ColorSwitcher

    " turn off the cursor blinking (who thinks that is a good idea?)
    set guicursor+=a:blinkon0

    if has("autocmd")
        " Default size of window
        autocmd VimEnter * exe 'VSSelectWindowSize bigger'
    endif

    " turn off the gui elements
    set guioptions=

    " OS Specific
    if has("gui_macvim")
        " disable the meta navigation keys set by macvim (so I can use them
        " for other things)
        let macvim_skip_cmd_opt_movement = 1
        " use the whole screen
        set fuoptions=maxvert,maxhorz
        " fancy powerline!
        let g:Powerline_symbols = 'fancy'
        " Use fancy ligatures
        set macligatures
        " use Monaco with no antialiasing
        set guifont=Fira\ Code:h12,Inconsolata-dz\ for\ Powerline:h11,Inconsolata-dz:h10,Inconsolata:h12,Monaco:h10
        set antialias
    endif

    if has("gui_gtk2")
        set guifont=Fira\ Code\ 12,Inconsolata\ Medium\ 10,Droid\ Sans\ Mono\ 9,Liberation\ Mono\ 10,LucidaTypewriter\ Medium\ 10,Terminal
        autocmd GUIEnter * set vb t_vb=
    endif
endif

" turn on folds
" vim: fdm=marker
