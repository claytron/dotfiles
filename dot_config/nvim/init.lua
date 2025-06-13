-- kickstart                                                                     {{{1
--[[

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
-- vim.o.breakindent = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- My Config                                                    {{{1
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
--    cox             -- Toggles NERDTree drawer
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
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- TODO: what should this be set to?
-- Python support via virtualenvs
--vim.g.python_host_prog = vim.fn.expand("~/.virtualenvs/neovim-py2/bin/python", ":p")
--vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python", ":p")

-- hide the backup and swap files
vim.o.backupdir = '~/.backup/vim,.,/tmp'
vim.o.directory = '~/.backup/vim/swap,.,/tmp'
vim.o.backupskip = '/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*'

-- Save undo history
vim.o.undofile = true
vim.o.undodir = '~/.backup/vim/undo,~/tmp,/tmp'

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

-- Colors and Syntax                                            {{{1
--------------------------------------------------------------------

-- TODO: is this needed?
-- turn on syntax highlighting
vim.cmd 'syntax on'

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
--vim.cmd 'ColorSwitcher catppuccin-latte'

-- Toggle the gutter
local function toggle_gutter_signs()
  if vim.o.signcolumn:match 'auto' or vim.o.signcolumn:match 'yes' then
    vim.o.signcolumn = 'no'

    -- TODO: is this needed?
    --vim.cmd('CocDisable')
  else
    vim.o.signcolumn = 'auto'
    -- TODO: is this needed?
    --vim.cmd('CocEnable')
  end
end

vim.api.nvim_create_user_command('ToggleGutterSigns', toggle_gutter_signs, {})

-- Toggle the gutter on and off
vim.keymap.set('n', 'cog', ':ToggleGutterSigns<CR>', { silent = true, desc = 'Toggle sign column' })

--
--
--
--
-- My Config end                                                {{{1
--
--
--
--

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
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

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
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
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
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

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

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

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
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
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
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

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          --if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          --  local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          --  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          --    buffer = event.buf,
          --    group = highlight_augroup,
          --    callback = vim.lsp.buf.document_highlight,
          --  })

          --  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          --    buffer = event.buf,
          --    group = highlight_augroup,
          --    callback = vim.lsp.buf.clear_references,
          --  })

          --  vim.api.nvim_create_autocmd('LspDetach', {
          --    group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          --    callback = function(event2)
          --      vim.lsp.buf.clear_references()
          --      vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          --    end,
          --  })
          --end

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

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
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
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
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

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
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

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: fdm=marker ts=2 sts=2 sw=2 et
