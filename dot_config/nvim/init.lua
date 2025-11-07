-- My vimrc uses folds
--
-- zi    toggle all folds (open or closed)
-- zR    open all folds
-- zM    close all folds
-- za    toggle fold at cursor position
-- zj    move down to start of next fold
-- zk    move up to end of previous fold

-- My vimrc command and mapping quick reference                 {{{1
-- -----------------------------------------------------------------
--
-- The mapleader has been switched from '\' to 'SPACE' anytime you see
-- <leader> that is what this refers to.
--
-- Change Option mnemonic                                       {{{2
-- -----------------------------------------------------------------
--    coc             -- Switch between light and dark colors
--    coe             -- Show current :Errors
--    cog             -- Toggle the gutter and clear signs
--    coh             -- Clear the current search highlight
--    coH             -- Toggles the highlight search
--    coi             -- Toggles invisible characters
--    col             -- Toggles the location list
--    con             -- Toggles the line numbers
--    conn            -- Toggles relative line numbers
--    coq             -- Toggle the quickfix window
--    cos             -- Toggle spell checking
--    cot             -- Change the tab name
--    cow             -- Toggle line wrapping
--    cox             -- Toggles file drawer
--
-- Clean Up mnemonic                                            {{{2
-- -----------------------------------------------------------------
--    cuw             -- Removes trailing whitespace characters
--    cuf             -- Clean up the current file using autoformat
--    cut             -- Find things to clean up. TODO, XXX, etc.
--    cuv             -- Sort a buildout versions.cfg file
--
-- File Type mnemonic                                           {{{2
-- -----------------------------------------------------------------
--    ftc             -- Change current filetype to CSS
--    fth             -- Change current filetype to HTML
--    ftj             -- Change current filetype to Javascript
--    ftm             -- Change current filetype to Markdown
--    ftp             -- Change current filetype to Python
--    ftr             -- Change current filetype to reStructuredText
--    ftv             -- Change current filetype to Vim
--    ftw             -- Change current filetype to Wiki
--
-- TeSt mnemonic
-- -----------------------------------------------------------------
--    tsl             -- :TestNearest
--    ts;             -- :TestFile
--    ts'             -- :TestSuite
--    tss             -- :TestLast
--
-- Fuzzy Finder mnemonic                                        {{{2
-- -----------------------------------------------------------------
--    ff              -- Fuzzy file mode
--    fft             -- Fuzzy tag mode
--    ffr             -- Fuzzy MRU mode
--    ffe             -- Fuzzy buffer mode
--    ffc             -- Fuzzy :colors mode
--
-- Tell Me mnemonic                                             {{{2
-- -----------------------------------------------------------------
--    tma             -- Starts an ack search in the CWD
--    tmf             -- Shows the current file in the NERDTree. This
--                       is the TextMate equivalent of ctrl+cmd+r
--    tmi             -- Toggle indent guides
--    tmy             -- Show the yankring
--    tmb             -- Shortcut for getting to NERDTree bookmarks
--    tm1             -- Set a highlight for the current word (1)
--    tm2             -- Set a highlight for the current word (2)
--    tm3             -- Set a highlight for the current word (3)
--    tmr             -- Show me reST preview
--    tmrk            -- Stop reST preview
--    tmm             -- Show me Markdown preview
--    tmmk            -- Stop Markdown preview
--    tmg             -- Toggle signify folds (show only vcs changes)
--    tmt             -- Show translations for the current key (rails)
--    tmte            -- Expand the current YAML key (rails)
--
-- Git stuff                                                    {{{2
-- -----------------------------------------------------------------
--    tgg             -- Git status (tmg was too hard, so tg)
--    //              -- Git grep (double tap to start)
--    tgd             -- Git diff
--    tgb             -- Git blame
--    tgbb            -- Show commit in browser
--    tgl             -- Git log on the current file (back 100)
--    tgll            -- Git log on the current project (back 100)
--    tgh             -- Git log search looking for + / - of term
--    tghh            -- Git log search with word in diff
--
-- Window Management                                            {{{2
-- -----------------------------------------------------------------
--    <C-W>-          -- Horizontal split
--    <C-W>|          -- Vertical split
--    <C-W>z          -- Zoom in on the current buffer
--    <C-W><C-E>      -- Cycle through windows
--    <C-H>           -- Move left to window
--    <C-J>           -- Move up to window
--    <C-K>           -- Move down to window
--    <C-L>           -- Move right to window
--    <C-W><C-H>      -- Move left to next tab
--    <C-W><C-L>      -- Move right to next tab
--    <C-W><C-N>      -- Create a new tab
--    <C-W><C-I>      -- Edit current file in a new tab
--    <C-W><C-X>      -- Close the current tab
--    +               -- Make the current window taller
--    -               -- Make the current window shorter
--
-- Other random stuff                                           {{{2
-- -----------------------------------------------------------------
--    ]q              -- Previous quickfix change
--    [q              -- Next quickfix change
--    ]w              -- Previous location list change
--    [w              -- Next location list change
--    tt              -- Opens up the taglist
--    Y               -- Yank to the end of the line, no newline
--    YY              -- Yank the current line, no newline
--    funi            -- Find the next non-ascii character (funny)
--    jj              -- Alternative to <ESC>
--    jk              -- Alternative to <ESC>
--    <leader>Enter   -- Split line at current cursor in normal mode
--    <F2>            -- Toggle smart indent on paste
--
-- Command line mappings                                        {{{2
-- -----------------------------------------------------------------
--
--    <C-a>           -- Beginning of the line
--    <C-c>           -- End of the line
--
-- Custom Commands                                              {{{2
-- -----------------------------------------------------------------
--
-- I have set up some custom commands that might be of interest
--
--    MarkdownToHTML  -- Converts the current buffer into HTML and
--                       places it in a scratch buffer.
--    MarkdownToHTMLCopy -- Same as previous, but copies to clipboard
--    Shell           -- Runs a shell command and places it in the
--                       scratch buffer
--    TidyXML         -- Runs tidy in XML mode on the current buffer
--    TabStyle        -- Set the tab style and number, :TabStyle space 4
--    W               -- Save the following file using sudo to avoid
--                       the [readonly] flag.

-- General setting                                              {{{1
--------------------------------------------------------------------

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Decrease update time
vim.o.updatetime = 250

-- Set a shorter timeout length to make jk and jj easier to use
vim.o.timeoutlen = 350

-- only increment numbers and letters
vim.o.nrformats = ''

-- set up jk as mode switch
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- :terminal settings
vim.g.terminal_scrollback_buffer_size = 100000

-- Python support via virtualenvs
vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python:p'

-- Save undo history
vim.o.undofile = true

-- have fifty lines of command-line (etc.) history:
-- TODO: is this just the default now?
vim.o.history = 10000

-- have the mouse enabled all the time
vim.o.mouse = 'a'
-- make a menu popup on right click
-- TODO: does this still do a thing in nvim?
vim.o.mousemodel = 'popup'

-- allow for switching buffers when a file has changes
vim.o.hidden = true

-- allow backspacing over everything in insert mode
vim.o.backspace = 'indent,eol,start'

-- Use the clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamed,unnamedplus'
end)

-- The first setting tells vim to use "autoindent" (that is, use the current
-- line's indent level to set the indent level of new lines). The second makes
-- vim attempt to intelligently guess the indent level of any new line based on
-- the previous line.
vim.o.autoindent = true
vim.o.smartindent = true

-- Only one space after periods when formatting strings
-- XXX: unknown option
--vim.o.nojoinspaces = true

-- Allow command line editing like emacs
vim.keymap.set('c', '<C-A>', '<Home>', { desc = 'Command-line: Move to beginning' })
vim.keymap.set('c', '<C-E>', '<End>', { desc = 'Command-line: Move to end' })

-- Highlight the word under the cursor
-- Adapted from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
vim.keymap.set('n', 'tm1', [[:execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<CR>]], { silent = true, desc = 'Highlight word (slot 1)' })
vim.keymap.set('n', 'tm2', [[:execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<CR>]], { silent = true, desc = 'Highlight word (slot 2)' })
vim.keymap.set('n', 'tm3', [[:execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<CR>]], { silent = true, desc = 'Highlight word (slot 3)' })
vim.keymap.set('n', 'tm0', ':ExtraHighlightsInit<CR>', { silent = true, desc = 'Reset highlight slots' })

-- Shortcut to cycle through quickfix list
vim.keymap.set('n', '[q', ':cnext<CR>', { silent = true, desc = 'Next quickfix item' })
vim.keymap.set('n', ']q', ':cprevious<CR>', { silent = true, desc = 'Previous quickfix item' })

-- Shortcut to cycle through location list
vim.keymap.set('n', '[w', ':lnext<CR>', { silent = true, desc = 'Next location item' })
vim.keymap.set('n', ']w', ':lprevious<CR>', { silent = true, desc = 'Previous location item' })

-- Use sane regexes
vim.keymap.set('n', '/', '/\\v', { desc = 'Use very magic regex (normal)' })
vim.keymap.set('v', '/', '/\\v', { desc = 'Use very magic regex (visual)' })
vim.keymap.set('n', '////', ':tab helpg \\v\\c<Left><Left>', { desc = 'Search help (very magic, case-insensitive)' })

-- Easy filetype switching
vim.keymap.set('n', 'ftm', ':set ft=markdown<CR>', { desc = 'Set filetype: markdown' })
vim.keymap.set('n', 'ftp', ':set ft=python<CR>', { desc = 'Set filetype: python' })
vim.keymap.set('n', 'ftw', ':set ft=wiki<CR>', { desc = 'Set filetype: wiki' })
vim.keymap.set('n', 'ftr', ':set ft=ruby<CR>', { desc = 'Set filetype: ruby' })
vim.keymap.set('n', 'ftrs', ':set ft=rst<CR>', { desc = 'Set filetype: reStructuredText' })
vim.keymap.set('n', 'ftv', ':set ft=vim<CR>', { desc = 'Set filetype: vim' })
vim.keymap.set('n', 'ftj', ':set ft=javascript<CR>', { desc = 'Set filetype: javascript' })
vim.keymap.set('n', 'fts', ':set ft=sql<CR>', { desc = 'Set filetype: sql' })
vim.keymap.set('n', 'ftsh', ':set ft=sh<CR>', { desc = 'Set filetype: shell script' })
vim.keymap.set('n', 'ftc', ':set ft=css<CR>', { desc = 'Set filetype: css' })
vim.keymap.set('n', 'fth', ':set ft=html<CR>', { desc = 'Set filetype: html' })

-- Visual settings                                              {{{1
--------------------------------------------------------------------
-- Used later to configure plugins to instruct them to use a nerd font
vim.g.have_nerd_font = true

-- tell the bell to go beep itself!
vim.o.visualbell = false

-- Always hide concealable content
vim.o.conceallevel = 2

-- vim.o.the title of the window
vim.o.title = true
vim.o.titlestring = '%f%([%M]%)'

-- Enhanced command menu ctrl + d to expand directories
vim.o.wildmenu = true
-- command <Tab> completion, list matches, then longest common part, then all.
vim.o.wildmode = 'list:longest,full'
-- Ignore case when tab completing
vim.o.wildignorecase = true
vim.opt.wildignore:append {
  '*.pyc',
  '*.pyo',
  'CVS',
  '.svn',
  '.git',
  '*.mo',
  '.DS_Store',
  '*.pt.cache',
  '*.Python',
  '*.o',
  '*.lo',
  '*.la',
  '*~',
  '.AppleDouble',
  '*/blobstorage/*',
  '*/Paste*-*.egg/*',
}

-- toggle spell checking
vim.keymap.set('n', 'cos', ':set spell!<CR>', { silent = true })
-- set spell language to English and enable spell checking
vim.o.spelllang = 'en'
vim.o.spell = true

-- This setting will cause the cursor to very briefly jump to a
-- brace/parentheses/bracket's "match" whenever you type a closing or
-- opening brace/parentheses/bracket.
vim.o.showmatch = true

-- Display an incomplete command in the lower right corner of the Vim window
vim.o.showcmd = true

-- vim.o.a margin of lines when scrolling
vim.o.scrolloff = 4
-- lines to scroll when cursor leaves screen
vim.o.scrolljump = 0

-- show the statusline in all windows
vim.o.laststatus = 2

-- vim.o.all window splits equal
vim.o.equalalways = true

-- more natural split direction
vim.o.splitbelow = true
vim.o.splitright = true

-- highlight the cursor line
vim.o.cursorline = true

-- turn on line numbers, aww yeah
vim.o.number = true
-- shortcut to turn off line numbers
vim.keymap.set('n', 'con', ':set number!<CR>', { silent = true })
-- toggle relative number
vim.keymap.set('n', 'conn', ':set relativenumber!<CR>', { silent = true })

-- don't redraw during macros
vim.o.lazyredraw = true

-- Set linebreak so words don't get split
vim.o.linebreak = true

-- Scroll in smaller increments when going horizontal
vim.o.sidescroll = 5

-- toggle line wrapping on/off
vim.keymap.set('n', 'cow', ':set wrap!<CR>', { silent = true })

vim.api.nvim_create_augroup('PreservingFilePosition', { clear = true })
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid or when inside an event handler
-- (happens when dropping a file on gvim).
-- Also don't do it when the mark is in the first line, that is the default
-- position when opening a file.
vim.api.nvim_create_autocmd('BufReadPost', {
  group = 'PreservingFilePosition',
  callback = function()
    local line = vim.fn.line
    if line [['"]] > 1 and line [['"]] <= line '$' then
      vim.cmd [[normal! g`"]]
    end
  end,
})
-- Jump to top for SVN and Git commit messages
vim.api.nvim_create_autocmd('BufReadPost', {
  group = 'PreservingFilePosition',
  pattern = { 'svn-commit*.tmp', 'COMMIT_EDITMSG*' },
  callback = function()
    vim.cmd 'normal! gg'
  end,
})

-- Define a Lua function to replicate NeatFoldText
-- Adapted from
-- http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function _G.NeatFoldText()
  local start_line = vim.fn.getline(vim.v.foldstart)
  local line = ' ' .. start_line:gsub([[^%s*"?%s*|%s*"?%s*{{{?%d*%s*]], '') .. ' '
  local lines_count = vim.v.foldend - vim.v.foldstart + 1
  local lines_count_text = '| ' .. string.format('%10s', lines_count .. ' lines') .. ' |'
  local foldchar = vim.opt.fillchars:get().fold or '·' -- fallback if not set
  local foldtextstart = string.sub('+' .. string.rep(foldchar, vim.v.foldlevel * 2) .. line, 1, math.floor((vim.fn.winwidth(0) * 2) / 3))
  local foldtextend = lines_count_text .. string.rep(foldchar, 8)
  local foldtextlength = vim.fn.strdisplaywidth(foldtextstart .. foldtextend) + vim.o.foldcolumn
  return foldtextstart .. string.rep(foldchar, math.max(0, vim.fn.winwidth(0) - foldtextlength)) .. foldtextend
end
-- Set the foldtext to the custom function
vim.opt.foldtext = 'v:lua.NeatFoldText()'

-- Searching                                                    {{{1
--------------------------------------------------------------------
-- find as you type
vim.o.incsearch = true
-- highlight the terms
vim.o.hlsearch = true
-- make searches case-insensitive
vim.o.ignorecase = true
-- unless they contain upper-case letters
vim.o.smartcase = true

-- a toggle for search highlight
vim.keymap.set('', 'coH', ':set hlsearch!<CR>', { silent = true })

-- Shortcut to clear out the search pattern (and thus turn off the highlighting)
-- Adapted from http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
vim.keymap.set('', 'coh', ':let @/ = ""<CR>', { silent = true })

-- Find any non-ascii character
vim.keymap.set('', 'funi', '/[^ -~]<CR>', { silent = true })

-- Colors and Syntax                                            {{{1
--------------------------------------------------------------------
-- TODO: is this needed?
-- highlight all python syntax
vim.g.python_highlight_all = 1

-- TODO: is this needed?
-- gui and terminal compatible color scheme
vim.o.background = 'light'

-- TODO: is this needed?
-- Use the "original" molokai theme colors instead of "dark"
vim.g.molokai_original = 1

-- TODO: is this needed?
-- Zenburn settings
vim.g.zenburn_alternate_Error = 1

-- TODO: is this needed?
-- Solarized settings
vim.g.solarized_termcolors = 16
vim.g.solarized_diffmode = 'high'
vim.g.neosolarized_termtrans = 1

-- Function to quickly apply and reset custom highlights
local function extra_highlights()
  -- Syntax highlights for tm1/tm2/tm3
  vim.cmd [[hi InterestingWord1 guifg=#eee8d5 guibg=#FF4300 ctermfg=254 ctermbg=166]]
  vim.cmd [[hi InterestingWord2 guifg=#eee8d5 guibg=#859900 ctermfg=254 ctermbg=64]]
  vim.cmd [[hi InterestingWord3 guifg=#eee8d5 guibg=#268bd2 ctermfg=254 ctermbg=33]]

  -- Highlight for IndentGuides
  vim.cmd [[hi IndentGuides guibg=#373737 ctermbg=237]]

  -- Clear previous matches
  vim.cmd [[match none | 2match none | 3match none]]

  -- Italic comments
  vim.cmd [[hi Comment cterm=italic]]

  -- Optional: PaperColor tweaks
  -- vim.cmd [[hi clear SpellBad]]
  -- vim.cmd [[hi clear SpellRare]]
  -- vim.cmd [[hi SpellBad cterm=undercurl gui=undercurl guisp=black]]
  -- vim.cmd [[hi ErrorMsg ctermfg=8 ctermbg=1 guifg=White guibg=Red]]
end

vim.api.nvim_create_user_command('ExtraHighlightsInit', extra_highlights, {})

-- A function to toggle between light and dark colors, or switch to a theme
local function color_switcher(opts)
  local theme = opts.args
  if theme ~= '' then
    vim.cmd 'hi clear'
    vim.cmd('colorscheme ' .. theme)
    extra_highlights()
    return
  end

  -- Toggle light/dark theme
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    vim.fn.system { 'kitty', '+kitten', 'themes', '--reload-in=all', 'catppuccin-latte' }
  else
    vim.o.background = 'dark'
    vim.fn.system { 'kitty', '+kitten', 'themes', '--reload-in=all', 'catppuccin-mocha' }
  end

  extra_highlights()
end

-- Completion for colorscheme names
local function complete_colorschemes(arglead, _, _)
  local schemes = {}
  local paths = vim.split(vim.fn.globpath(vim.o.runtimepath, 'colors/*.vim'), '\n')
  for _, path in ipairs(paths) do
    local name = vim.fn.fnamemodify(path, ':t:r')
    if not name:match '_custom$' then
      table.insert(schemes, name)
    end
  end
  return vim.tbl_filter(function(val)
    return val:match('^' .. arglead)
  end, schemes)
end

vim.api.nvim_create_user_command('ColorSwitcher', color_switcher, {
  nargs = '?',
  complete = complete_colorschemes,
})

-- switch between light and dark colors
vim.keymap.set('n', 'coc', ':ColorSwitcher<CR>', { silent = true, desc = 'Toggle light/dark theme or switch theme' })

-- Enable true color
vim.o.termguicolors = true

-- set initial colorscheme
-- TODO: move this to plugin config below?
--vim.cmd 'ColorSwitcher catppuccin-latte'

-- Keep signcolumn on by default
vim.o.signcolumn = 'auto'

-- Toggle the gutter
local function toggle_gutter_signs()
  if vim.o.signcolumn:match 'auto' or vim.o.signcolumn:match 'yes' then
    vim.o.signcolumn = 'no'
  else
    vim.o.signcolumn = 'auto'
  end
end

vim.api.nvim_create_user_command('ToggleGutterSigns', toggle_gutter_signs, {})

-- Toggle the gutter on and off
vim.keymap.set('n', 'cog', ':ToggleGutterSigns<CR>', { silent = true, desc = 'Toggle sign column' })

-- Custom functions and commands                                {{{1
--------------------------------------------------------------------

-- Tabs and spaces                                              {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- command to switch tab styles
vim.api.nvim_create_user_command('TabStyle', function(opts)
  local tab_type = opts.fargs[1]
  local tab_length = tonumber(opts.fargs[2]) or 4
  vim.opt.softtabstop = tab_length
  vim.opt.shiftwidth = tab_length
  vim.opt.tabstop = tab_length
  vim.opt.expandtab = (tab_type == 'space')
end, { nargs = '+' })

-- default tab style
vim.cmd 'TabStyle space 2'

-- Shell as scratch buffer                                      {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- function to run shell commands and create a scratch buffer (modified
-- slightly so that it doesn't show the command and it's interpretation)
-- http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
-- Example, show output of ls in a scratch buffer:
--
-- :Shell ls -al
vim.api.nvim_create_user_command('Shell', function(opts)
  local cmdline = opts.args
  for part in vim.split(cmdline, ' ') do
    if part:match '^%%' or part:match '^#' or part:match '^<' then
      local expanded = '"' .. vim.fn.fnameescape(vim.fn.expand(part)) .. '"'
      cmdline = cmdline:gsub(vim.pesc(part), expanded)
    end
  end
  vim.cmd 'botright new'
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.bufhidden = 'wipe'
  vim.opt_local.nobuflisted = true
  vim.opt_local.swapfile = false
  vim.opt_local.wrap = false
  vim.fn.setline(1, string.rep('=', vim.fn.winwidth(0)))
  vim.cmd('$read !' .. cmdline)
  vim.opt_local.modifiable = false
  vim.cmd '1'
end, { nargs = '+', complete = 'shellcmd' })

-- Markdown                                                     {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- run markdown on the current file and place the html in a scratch buffer
vim.api.nvim_create_user_command('MarkdownToHTML', function()
  vim.cmd 'Shell Markdown.pl %'
end, {})

-- replace the current buffer with the html version of the markdown
vim.api.nvim_create_user_command('MarkdownToHTMLReplace', function()
  vim.cmd '%!Markdown.pl "%"'
end, {})

-- copy the html version of the markdown to the clipboard
vim.api.nvim_create_user_command('MarkdownToHTMLCopy', function()
  vim.cmd '!Markdown.pl "%" | clipboard'
end, {})

-- use pandoc to convert from html into markdown
vim.api.nvim_create_user_command('MarkdownFromHTML', function()
  vim.cmd '%!pandoc -f html -t markdown_github "%"'
end, {})

-- Quickfix                                                     {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Borrowed from
-- http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window

local function get_buffer_list()
  return vim.fn.execute 'ls!'
end

local function toggle_list(bufname, pfx)
  for line in vim.fn.split(get_buffer_list(), '\n') do
    if line:match(bufname) then
      local bufnr = tonumber(line:match '^%s*(%d+)')
      if bufnr and vim.fn.bufwinnr(bufnr) ~= -1 then
        vim.cmd(pfx .. 'close')
        return
      end
    end
  end
  if pfx == 'l' and #vim.fn.getloclist(0) == 0 then
    vim.api.nvim_echo({ { 'Location List is Empty.', 'ErrorMsg' } }, true, {})
    return
  end
  local winnr = vim.fn.winnr()
  vim.cmd(pfx .. 'open')
  if vim.fn.winnr() ~= winnr then
    vim.cmd 'wincmd p'
  end
end

vim.keymap.set('n', 'coq', function()
  toggle_list('Quickfix List', 'c')
end, { silent = true })
vim.keymap.set('n', 'col', function()
  toggle_list('Location List', 'l')
end, { silent = true })

-- Diagnostic keymaps
-- TODO: I think I have a simlar one, but does it work?
vim.keymap.set('n', 'coe', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Copy search matches to register                              {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Copy matches of the last search to a register (default is the clipboard).
-- Accepts a range (default is whole file).
-- 'CopyMatches'   copy matches to clipboard (each match has \n added).
-- 'CopyMatches x' copy matches to register x (clears register first).
-- 'CopyMatches X' append matches to register x.
-- We skip empty hits to ensure patterns using '\ze' don't loop forever.
vim.api.nvim_create_user_command('CopyMatches', function(opts)
  local reg = opts.reg or '+'
  local hits = {}
  local lines = vim.fn.getline(opts.line1, opts.line2)
  for _, txt in ipairs(lines) do
    local idx = vim.fn.match(txt, vim.fn.getreg '/')
    while idx >= 0 do
      local end_ = vim.fn.matchend(txt, vim.fn.getreg '/', idx)
      if end_ > idx then
        table.insert(hits, txt:sub(idx + 1, end_))
      else
        end_ = end_ + 1
      end
      if vim.fn.getreg('/'):sub(1, 1) == '^' then
        break
      end
      idx = vim.fn.match(txt, vim.fn.getreg '/', end_)
    end
  end
  if #hits > 0 then
    vim.fn.setreg(reg, table.concat(hits, '\n') .. '\n')
  else
    print 'No hits'
  end
end, { range = '%', register = true })

-- :global to buffer                                            {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Output the last global command to a buffer for further use
vim.api.nvim_create_user_command('GlobalToBuffer', function()
  vim.cmd [[
    normal! 0"ay0
    g//y A
    split | enew
    setlocal buftype=nofile
    put! a
    normal! ggddGdd
  ]]
end, { desc = 'Copy results of last global search to a new buffer for editing' })

-- Open a buffer number in a vertical split                     {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Vertical Split Buffer Function
vim.api.nvim_create_user_command('Vbuffer', function(opts)
  vim.cmd('vert belowright sb ' .. opts.args)
end, { nargs = 1 })

-- Show indent guides                                           {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Taken from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
-- though that may not be the originator.
local indentguides_state = 0
function _G.IndentGuides()
  if indentguides_state == 1 then
    indentguides_state = 0
    vim.cmd '2match None'
  else
    indentguides_state = 1
    local sw = vim.o.shiftwidth
    local parts = {}
    for i = 0, 7 do
      table.insert(parts, '\\%' .. (i * sw + 1) .. 'v')
    end
    local pattern = '\\%(^\\s*\\)\\@<=\\%(' .. table.concat(parts, '\\|') .. '\\)\\s'
    vim.cmd('2match IndentGuides /' .. pattern .. '/')
  end
end

vim.keymap.set('n', 'tmi', '<cmd>lua IndentGuides()<CR>', { silent = true })

-- Save a file with sudo when it is [readonly]                  {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Taken from command line fu.
-- http://www.commandlinefu.com/commands/view/9425
vim.api.nvim_create_user_command('W', function()
  vim.cmd 'silent w !sudo tee % > /dev/null'
  vim.cmd 'edit!'
end, {})

-- Open help in a tab                                           {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- via http://stackoverflow.com/a/7515418/34530
vim.cmd [[
  cnoreabbrev <expr> help     getcmdtype() == ":" && getcmdline() == 'help'     ? 'tab help'     : 'help'
  cnoreabbrev <expr> h        getcmdtype() == ":" && getcmdline() == 'h'        ? 'tab help'     : 'h'
  cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
  cnoreabbrev <expr> helpg    getcmdtype() == ":" && getcmdline() == 'helpg'    ? 'tab helpg'    : 'helpg'
]]

-- Auto command settings                                        {{{1
--~-----------------------------------------------------------------

-- Highlight when yanking (copying) text
-- Taken from kickstart.nvim
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- augroup FileTypes
local filetype_group = vim.api.nvim_create_augroup('FileTypes', { clear = true })

-- Turn off spelling for quickfix
vim.api.nvim_create_autocmd('WinEnter', {
  group = filetype_group,
  pattern = '*',
  callback = function()
    if vim.bo.buftype == 'quickfix' then
      vim.opt_local.spell = false
    end
  end,
})

-- jinja syntax automagically
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.jinja',
  command = 'set filetype=jinja',
})

-- vimperator and pentadactyl files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { '*.vimp', '*.penta', '.vimperatorrc', '.pentadactylrc' },
  command = 'set filetype=vim',
})

-- vim pager settings
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '.vimpagerrc',
  command = 'set filetype=vim',
})

-- anything with the wiki extension should be treated as such
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.wiki',
  command = 'set filetype=wiki',
})

-- shell files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { 'dot_common*', '.common*' },
  command = 'set filetype=sh',
})
-- Use FileType event with higher priority to override other plugins
vim.api.nvim_create_autocmd('FileType', {
  group = filetype_group,
  pattern = '*',
  callback = function()
    local filepath = vim.fn.expand('%:p')
    if filepath:match('%.sh%.tmpl$') then
      vim.bo.filetype = 'sh.template'
    end
  end,
})

-- Not sure why sh.template gets overriden for sh, claude thought this and the above were a good idea
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { 'dot_common*.tmpl', '.common*.tmpl', '*.sh.tmpl' },
  callback = function()
    vim.schedule(function()
      vim.bo.filetype = 'sh.template'
    end)
  end,
})

-- vim help files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/doc/*.txt',
  command = 'set filetype=help',
})

-- Vagrant files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = 'Vagrantfile',
  command = 'set filetype=ruby',
})

-- csvbuilder files in rails
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.csvbuilder',
  command = 'set filetype=ruby',
})

-- Pry config is ruby
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '.pryrc',
  command = 'set filetype=ruby',
})

-- ERD config is yaml
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '.erdconfig',
  command = 'set filetype=yaml',
})

-- psql sessions in Postgres
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = 'psql.edit.*',
  command = 'set filetype=sql',
})

-- Turn off folding in git windows
vim.api.nvim_create_autocmd('Syntax', {
  group = filetype_group,
  pattern = 'git',
  command = 'setlocal nofoldenable',
})

-- Don't show invisibles in the terminal. Also go into insert mode.
vim.api.nvim_create_autocmd('TermOpen', {
  group = filetype_group,
  pattern = '*',
  command = 'setlocal nolist',
})
vim.api.nvim_create_autocmd('TermOpen', {
  group = filetype_group,
  pattern = '*',
  command = 'startinsert',
})

-- Go back to normal mode in the terminal once process is
-- complete, this stops the any key to close behavior.
vim.api.nvim_create_autocmd('TermClose', {
  group = filetype_group,
  pattern = '*',
  command = 'call feedkeys("\\<C-\\\\>\\<C-n>")',
})

-- Zope and Plone files
-- -----------------------------------------------------------------
-- set up zope page templates as the zpt filetype
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { '*.pt', '*.cpt', '*.zpt' },
  command = 'set filetype=zpt syntax=xml',
})

-- xml syntax for zcml files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.zcml',
  command = 'set filetype=zcml syntax=xml',
})

-- css.dtml as css
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.css.dtml',
  command = 'set filetype=css.dtml',
})

-- kss files as css
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.kss',
  command = 'set filetype=kss.css',
})

-- js.dtml as javascript
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.js.dtml',
  command = 'set filetype=javascript.dtml',
})

-- any txt file in a `tests` directory is a doctest
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/tests/*.txt',
  command = 'set filetype=doctest.rst',
})

-- Chef and foodcritic
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/cookbooks/*.rb',
  command = 'set filetype=ruby.chef',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/cookbooks/*.erb',
  command = 'set filetype=eruby.chef',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/cookbooks/*.yml',
  command = 'set filetype=yaml.chef',
})

-- Proselint
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '.proselintrc',
  command = 'set filetype=json',
})

-- i3
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/.i3/config',
  command = 'set filetype=i3config',
})

-- terraform templates
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*/**/*.tftpl',
  command = 'set filetype=terraform',
})

-- Dynamics CRM WebResources
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = [[*css[0-9a-zA-Z]\{8\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{12\}]],
  command = 'set filetype=css',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = [[*js[0-9a-zA-Z]\{8\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{12\}]],
  command = 'set filetype=javascript',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = [[*html[0-9a-zA-Z]\{8\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{4\}-[0-9a-zA-Z]\{12\}]],
  command = 'set filetype=html',
})

-- Tmux files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = '*.tmux',
  command = 'set filetype=tmux',
})

-- helm files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { '*chart*/**/*.y*ml', '*chart*/*.y*ml' },
  command = 'set filetype=helm',
})

-- Anything with Brewfile in it
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_group,
  pattern = { '.Brewfile.*', 'Brewfile.*' },
  command = 'set filetype=ruby syntax=brewfile',
})

-- Cursor and window controls                                   {{{1
--~-----------------------------------------------------------------

-- Make cursor move by visual lines instead of file lines (when wrapping)
-- This makes me feel more at home :)
vim.keymap.set('n', '<up>', 'gk')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('i', '<up>', '<C-o>gk')
vim.keymap.set('n', '<down>', 'gj')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('i', '<down>', '<C-o>gj')
vim.keymap.set('n', 'E', 'ge')

-- window resizing
if vim.fn.bufwinnr(1) ~= -1 then
  vim.keymap.set('n', '+', '<C-W>+')
  vim.keymap.set('n', '-', '<C-W>-')
end

-- open a new line from the current spot (sort of the opposite of J)
vim.keymap.set('', '<leader><CR>', 'i<CR><ESC>')

-- Yank from the cursor to the end of the line, to be consistent with C and D.
vim.keymap.set('n', 'Y', 'yg_')

-- Yank an entire line without the line ending and leading space
vim.keymap.set('n', 'YY', '^yg_')

-- sort versions in a versions.cfg
vim.keymap.set('', 'cuv', [[/\[versions\]<CR>jVG:g/^#/d<CR>gv:g/^$/d<CR>gv:sort i<CR>:w<CR>]])

-- Set the fill characters so they aren't annoying
vim.opt.fillchars = { vert = '┃', diff = '·', fold = '·' }

-- set up the invisible characters
vim.opt.listchars = {
  tab = '▸ ',
  eol = '¬',
  trail = '·',
  nbsp = '·',
  extends = '›',
  precedes = '‹',
}

-- show invisible characters by default
vim.opt.list = true

-- toggle invisible characters
vim.keymap.set('n', 'coi', ':set list!<CR>', { silent = true })

-- Window management settings                                   {{{1
-- -----------------------------------------------------------------

-- Mapping window commands directly
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move between tabs
vim.keymap.set('n', '<C-W><C-L>', ':tabnext<CR>', { silent = true, desc = 'Move focus to next tab' })
vim.keymap.set('n', '<C-W><C-H>', ':tabprevious<CR>', { silent = true, desc = 'Move focus to previous tab' })
vim.keymap.set('n', '<C-W><C-N>', ':tabnext<CR>', { silent = true, desc = 'Move focus to next tab' })
vim.keymap.set('n', '<C-W><C-P>', ':tabprevious<CR>', { silent = true, desc = 'Move focus to previous tab' })

-- Create a new tab
vim.keymap.set('n', '<C-W><C-T>', ':tabnew<CR>', { silent = true })

-- Edit current buffer in a tab (think tmux zoom)
vim.keymap.set('n', '<C-W><C-I>', ':tabedit %<CR>', { silent = true })

-- Close the current tab
vim.keymap.set('n', '<C-W><C-X>', ':tabclose<CR>', { silent = true })

-- cycle windows
vim.keymap.set('n', '<C-W>e', '<C-W>W')
vim.keymap.set('n', '<C-W><C-E>', '<C-W>W')

-- Window splits like I have mapped in tmux (- horizontal, | vertical)
vim.keymap.set('n', '<C-W>-', '<C-W>s')
vim.keymap.set('n', '<C-W>|', '<C-W>v')

-- Zoom like in tmux too
vim.keymap.set('n', '<C-W>z', '<C-W>o')

-- Deal with neovim terminals and window movement
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-h>]])
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-j>]])
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-k>]])
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-l>]])

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- TODO: does this work?
-- or just use <C-\><C-n> to exit terminal mode
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Plugins                                                      {{{1
--------------------------------------------------------------------

-- Lazy install                                                 {{{2
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {

  -- Guess indent                                               {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- TODO: get rid of my tabstyle script?
  --'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- Chezmoi                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'andre-kotake/nvim-chezmoi',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {
      edit = { apply_on_save = 'confirm' },
    },
    config = function(_, opts)
      require('nvim-chezmoi').setup(opts)
    end,
  },

  -- Gitsigns                                                   {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function()
      require('gitsigns').setup {
        vim.keymap.set('n', 'tgb', require('gitsigns').blame),
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'Stage hunk' })

          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'Reset hunk' })

          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
          map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

          map('n', '<leader>hb', function()
            gitsigns.blame_line { full = true }
          end, { desc = 'Blame line' })

          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff this' })

          map('n', '<leader>hD', function()
            gitsigns.diffthis '~'
          end, { desc = 'Diff this' })

          map('n', '<leader>hQ', function()
            gitsigns.setqflist 'all'
          end, { desc = 'Quickfix list all' })
          map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Quickfix list' })

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Line blame' })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

          -- Text object
          map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select hunk text object' })
        end,
      }
    end,
  },

  -- Which key                                                  {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 400,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- Telescope git grep                                         {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- TODO: not sure this will completely work for my use cases of searching old commits too
    'davvid/telescope-git-grep.nvim',
    config = function()
      vim.keymap.set('n', '//', function()
        require('git_grep').live_grep({additional_args = { "-i"}})
      end, { desc = 'Search current git project' })
      vim.keymap.set('n', '//i', function()
        require('git_grep').live_grep({search_title = 'Live Git Grep (case sensitive)', additional_args = { "--no-ignore-case"}})
      end, { desc = 'Search current git project' })
    end,
  },

  -- Telescope                                                  {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        pickers = {
          help_tags = {
            mappings = {
              i = {
                ['<cr>'] = 'select_tab',
              },
              n = {
                ['<cr>'] = 'select_tab',
              },
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

      -- My old ways
      vim.keymap.set('n', 'ff', builtin.git_files, { desc = 'Fuzzy find all files' })
      vim.keymap.set('n', 'ffa', builtin.find_files, { desc = 'Fuzzy find all files' })
      vim.keymap.set('n', 'ffb', builtin.buffers, { desc = 'Fuzzy find buffers' })
      vim.keymap.set('n', 'ffc', builtin.commands, { desc = 'Fuzzy find commands' })
      vim.keymap.set('n', 'ffe', builtin.diagnostics, { desc = 'Fuzzy find error diagnostics' })
      vim.keymap.set('n', 'ffh', builtin.help_tags, { desc = 'Fuzzy find help' })
      vim.keymap.set('n', 'ffr', function()
        builtin.oldfiles { only_cwd = true }
      end, { desc = 'Fuzzy find Recent Files in CWD ("." for repeat)' })
      vim.keymap.set('n', 'ffra', builtin.oldfiles, { desc = 'Fuzzy find Recent Files' })
      vim.keymap.set('n', '///', builtin.live_grep, { desc = 'Search all files' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })
    end,
  },

  -- LSP Plugins                                                {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- LSP Config                                                 {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Find references for the word under your cursor.
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        bashls = {},
        helm_ls = {},
        yamlls = {},
        ruff = {},
        ts_ls = {},
        ruby_lsp = {},
        rubocop = {},
        dockerls = {},
        docker_compose_language_service = {},
        prosemd_lsp = {},
        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'markdownlint-cli2',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- Conform                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        'cuf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      --   function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     return nil
      --   else
      --     return {
      --       timeout_ms = 500,
      --       lsp_format = 'fallback',
      --     }
      --   end
      -- end,

      formatters_by_ft = {
        lua = { 'stylua' },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        python = { 'isort', 'black' },
        ['markdown'] = { 'markdownlint-cli2' },
        ['markdown.mdx'] = { 'markdownlint-cli2' },
        terraform = { 'terraform_fmt' },
      },
    },
  },

  -- Blink                                                      {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Avante completion
      'Kaiser-Yang/blink-cmp-avante',
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          -- avante = { module = 'blink-cmp-avante', name = 'Avante', opts = {} },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },

  -- Catppuccin                                                 {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },

  -- Render Markdown                                            {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      sign = {
        enabled = false,
      },
      code = {
        width = 'block',
        min_width = 72,
        right_pad = 2,
        left_pad = 2,
        border = 'thick',
        position = 'right',
        language_pad = 2,
      },
    },
  },

  -- Peek                                                       {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      local peek = require 'peek'
      peek.setup()
      vim.keymap.set('n', 'tmm', function()
        peek.open()
      end, { desc = 'Open markdown preview' })
      vim.keymap.set('n', 'tmmk', function()
        peek.close()
      end, { desc = 'Close markdown preview' })
    end,
  },

  -- TODO Comments                                              {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Mini                                                       {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup {
        respect_selection_type = true,
      }

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Highlight and clean up trailing whitespace
      require('mini.trailspace').setup()
      local trailspace = require 'mini.trailspace'
      vim.keymap.set('n', 'cuw', function()
        trailspace.trim()
      end, { silent = true, desc = 'Trim trailing whitespace' })
    end,
  },

  -- Treesitter                                                 {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- Treesitter endwise                                         {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  { -- add end to ruby, bash, etc.
    'RRethy/nvim-treesitter-endwise',
  },

  -- Autopairs                                                  {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Neotree                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim',
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
    },
    config = function()
      vim.keymap.set('n', 'cox', ':Neotree toggle<CR>', { desc = 'Toggle file drawer' })
      vim.keymap.set('n', 'tmf', ':Neotree reveal<CR>', { desc = 'Show current file in drawer' })
    end,
  },

  -- Neogit                                                     {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      vim.keymap.set('n', 'tgg', neogit.open, { desc = 'Show git status' })
      vim.keymap.set('n', 'tgl', function()
        neogit.open { 'log' }
      end, { desc = 'Git log popup' })
      vim.keymap.set('n', 'tgll', function()
        neogit.action('log', 'log_current')()
      end, { desc = 'Show git log for repo' })
    end,
  },

  -- MCP hub                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- {
  --   'ravitemer/mcphub.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  --   config = function()
  --     require('mcphub').setup {
  --       extensions = {
  --         avante = {
  --           make_slash_commands = true, -- make /slash commands from MCP server prompts
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- Avante                                                     {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {},
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'nvim-telescope/telescope.nvim',
  --     'folke/snacks.nvim',
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  --   config = function()
  --     require('avante').setup {
  --       -- system_prompt as function ensures LLM always has latest MCP server state
  --       -- This is evaluated for every message, even in existing chats
  --       system_prompt = function()
  --         local hub = require('mcphub').get_hub_instance()
  --         return hub and hub:get_active_servers_prompt() or ''
  --       end,
  --       -- Using function prevents requiring mcphub before it's loaded
  --       custom_tools = function()
  --         return {
  --           require('mcphub.extensions.avante').mcp_tool(),
  --         }
  --       end,
  --       disabled_tools = {
  --         'list_files', -- Built-in file operations
  --         'search_files',
  --         'read_file',
  --         'create_file',
  --         'rename_file',
  --         'delete_file',
  --         'create_dir',
  --         'rename_dir',
  --         'delete_dir',
  --         'bash', -- Built-in terminal access
  --       },
  --     }
  --   end,
  -- },

  -- Snacks                                                     {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      gitbrowse = {
        enabled = true,
      },
      image = {
        force = true,
      },
      scratch = {
        filekey = {
          cwd = true,
          branch = false,
          count = true,
        },
      },
    },
    keys = {
      -- gitbrowse
      {
        'tgbb',
        function()
          require('snacks').gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },

      -- scratch
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>.f",  function()
        require('telescope.builtin').filetypes({
          attach_mappings = function(_, map)
            local function create_scratch_with_ft(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry()
              require('telescope.actions').close(prompt_bufnr)
              Snacks.scratch({ ft = selection.value })
            end
            map('i', '<CR>', create_scratch_with_ft)
            map('n', '<CR>', create_scratch_with_ft)
            return true
          end
        })
      end, desc = "Toggle Scratch Buffer (with Filetype)" },
    },
  },

  -- Trouble                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'folke/trouble.nvim',
    opts = {
      follow = false,
      focus = true,
      auto_preview = false,
    },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  -- Neotest                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'olimorris/neotest-rspec',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-rspec' {
            rspec_cmd = function()
              return vim.tbl_flatten {
                'bundle',
                'exec',
                'rspec',
                '--deprecation-out',
                '/dev/null',
                '--out',
                '/dev/null',
                '-f',
                'failures',
              }
            end,
          },
        },
      }

      local neotest = require 'neotest'
      vim.keymap.set('n', 'tsl', function()
        neotest.run.run()
      end, { desc = 'Run the nearest test' })
      vim.keymap.set('n', 'ts;', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'Run the tests for the current file' })
    end,
  },

  -- Outline                                                    {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
      { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
    opts = {
      -- Your setup opts here
    },
  },

  -- Colorizer                                                  {{{2
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        RRGGBBAA = true,
        AARRGGBB = true,
        css_fn = true,
      },
    },
  },
}

-- vim: fdm=marker ts=2 sts=2 sw=2 et
