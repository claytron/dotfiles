" =============================================================================
"
" File:        mayansmoke.vim
" Description: Vim color scheme file
" Maintainer:  Jeet Sukumaran
"
" =============================================================================

"  Initialization and Setup {{{1
" =============================================================================
set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "mayansmoke"
" }}}

"  Normal Color {{{1
" =============================================================================
hi Normal gui=NONE   guifg=Black guibg=#F5F5EE
hi Normal cterm=NONE ctermfg=16  ctermbg=255
" }}}

"  Syntax (General) {{{1
" =============================================================================
" Groups ('*' = major; see 'help group-name'):
"   *Comment        any comment
"   *Constant       any constant
"       String         a string constant: "this is a string"
"       Character      a character constant: 'c', '\n'
"       Number         a number constant: 234, 0xff
"       Boolean        a boolean constant: TRUE, false
"       Float          a floating point constant: 2.3e10
"   *Identifier     any variable name
"       Function       function name (also: methods for classes)
"   *Statement      any statement
"       Conditional    if, then, else, endif, switch, etc.
"       Repeat         for, do, while, etc.
"       Label          case, default, etc.
"       Operator       "sizeof", "+", "*", etc.
"       Keyword        any other keyword
"       Exception      try, catch, throw
"   *PreProc        generic Preprocessor
"       Include        preprocessor #include
"       Define         preprocessor #define
"       Macro          same as Define
"       PreCondit      preprocessor #if, #else, #endif, etc.
"   *Type           int, long, char, etc.
"       StorageClass   static, register, volatile, etc.
"       Structure      struct, union, enum, etc.
"       Typedef        A typedef
"   *Special        any special symbol
"       SpecialChar    special character in a constant
"       Tag            you can use CTRL-] on this
"       Delimiter      character that needs attention
"       SpecialComment special things inside a comment
"       Debug          debugging statements
"   *Error          any erroneous construct
"   *Todo           anything that needs extra attention
hi Comment      guifg=SlateGray3        guibg=NONE      gui=italic
hi Comment      ctermfg=110
hi Constant     guifg=DarkOrange        guibg=NONE      gui=NONE
hi Constant     ctermfg=214
    hi String   guifg=Aquamarine4       guibg=NONE      gui=NONE
    hi String   ctermfg=30
    hi Boolean  guifg=IndianRed4        guibg=NONE      gui=NONE
    hi Boolean  ctermfg=88
hi Identifier   guifg=brown3            guibg=NONE      gui=NONE
hi Identifier   ctermfg=160
hi Function     guifg=VioletRed4        guibg=NONE      gui=NONE
hi Function     ctermfg=132
hi Statement    guifg=blue1             guibg=NONE      gui=NONE
hi Statement    ctermfg=21
hi Keyword      guifg=DodgerBlue        guibg=NONE      gui=NONE
hi Keyword      ctermfg=45
hi PreProc      guifg=blue1             guibg=NONE      gui=NONE
hi PreProc      ctermfg=27
hi Type         guifg=LightSlateBlue    guibg=NONE      gui=NONE
hi Type         ctermfg=147
hi Special      guifg=DarkOliveGreen4   guibg=NONE      gui=NONE
hi Special      ctermfg=64
hi Ignore       guifg=bg                guibg=NONE      gui=NONE
hi Ignore       ctermfg=255
hi Error        guifg=Red               guibg=NONE      gui=underline
hi Error        ctermfg=196             ctermbg=255     term=none
hi Todo         guifg=tan4              guibg=NONE      gui=underline
hi Todo         ctermfg=136             ctermbg=255     cterm=NONE
" }}}

"  Syntax (Vim) {{{1
" =============================================================================
hi VimError         guifg=red            guibg=Black   gui=bold
hi VimError         ctermfg=160          ctermbg=16
hi VimCommentTitle  guifg=DarkSlateGray4 guibg=bg      gui=bold,italic
hi VimCommentTitle  ctermfg=110
" }}}

" Syntax (QuickFix) {{{1
" =============================================================================
hi qfLineNr         guifg=black          guibg=green1      gui=bold
hi qfLineNr         ctermfg=16           ctermbg=46        cterm=NONE
" 1}}}

" Syntax (Python) {{{1
" =============================================================================
hi pythonDecorator guifg=orange3 guibg=NONE gui=bold
hi pythonDecorator ctermfg=208   ctermbg=255 cterm=NONE
hi link pythonDecoratorFunction pythonDecorator
" 1}}}

"  Highlight Groups {{{1
" =============================================================================
" Groups (see ':help highlight-groups'):
"    Cursor          the character under the cursor
"    CursorIM        like Cursor, but used when in IME mode |CursorIM|
"    CursorColumn    the screen column that the cursor is in when 'cursorcolumn' is set
"    CursorLine      the screen line that the cursor is in when 'cursorline' is set
"    Directory       directory names (and other special names in listings)
"    DiffAdd         diff mode: Added line |diff.txt|
"    DiffChange      diff mode: Changed line |diff.txt|
"    DiffDelete      diff mode: Deleted line |diff.txt|
"    DiffText        diff mode: Changed text within a changed line |diff.txt|
"    ErrorMsg        error messages on the command line
"    VertSplit       the column separating vertically split windows
"    Folded          line used for closed folds
"    FoldColumn      'foldcolumn'
"    SignColumn      column where |signs| are displayed
"    IncSearch       'incsearch' highlighting; also used for the text replaced with ":s///c"
"    LineNr          Line number for ":number" and ":#" commands, and when 'number' option is set.
"    MatchParen      The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
"    ModeMsg         'showmode' message (e.g., "-- INSERT --")
"    MoreMsg         |more-prompt|
"    NonText         '~' and '@' at the end of the window, etc.
"    Normal          normal text
"    Pmenu           Popup menu: normal item.
"    PmenuSel        Popup menu: selected item.
"    PmenuSbar       Popup menu: scrollbar.
"    PmenuThumb      Popup menu: Thumb of the scrollbar.
"    Question        |hit-enter| prompt and yes/no questions
"    Search          Last search pattern highlighting (see 'hlsearch').
"    SpecialKey      Meta and special keys listed with ":map", text that is displayed differently from what it really is (such as tabs, spaces in listchars etc.).
"    SpellBad        Word that is not recognized by the spellchecker. |spell|
"    SpellCap        Word that should start with a capital. |spell|
"    SpellLocal      Word that is recognized by the spellchecker as one that is
"    SpellRare       Word that is recognized by the spellchecker as one that is hardly ever used. |spell|
"    StatusLine      status line of current window
"    StatusLineNC    status lines of not-current windows
"    TabLine         tab pages line, not active tab page label
"    TabLineFill     tab pages line, where there are no labels
"    TabLineSel      tab pages line, active tab page label
"    Title           titles for output from ":set all", ":autocmd" etc.
"    Visual          Visual mode selection
"    VisualNOS       Visual mode selection when vim is "Not Owning the Selection".
"    WarningMsg      warning messages
"    WildMenu        current match in 'wildmenu' completion
hi Cursor       guifg=bg                guibg=fg                gui=NONE
hi Cursor       ctermfg=255             ctermbg=16              cterm=NONE
hi CursorColumn guifg=NONE              guibg=white             gui=NONE
hi CursorColumn ctermfg=NONE            ctermbg=255             cterm=NONE
hi CursorIM     guifg=bg                guibg=fg                gui=NONE
hi CursorIM     ctermfg=255             ctermbg=16              cterm=NONE
hi CursorLine   guifg=NONE              guibg=white             gui=NONE
hi CursorLine   ctermfg=NONE            ctermbg=254             cterm=NONE
hi lCursor      guifg=bg                guibg=fg                gui=NONE
hi lCursor      ctermfg=255             ctermbg=16              cterm=NONE
hi DiffAdd      guifg=NONE              guibg=SeaGreen1         gui=NONE
hi DiffAdd      ctermfg=16              ctermbg=48              cterm=NONE
hi DiffChange   guifg=NONE              guibg=LightSkyBlue1     gui=NONE
hi DiffChange   ctermfg=16              ctermbg=153             cterm=NONE
hi DiffDelete   guifg=NONE              guibg=LightCoral        gui=NONE
hi DiffDelete   ctermfg=16              ctermbg=203             cterm=NONE
hi DiffText     guifg=NONE              guibg=yellow            gui=NONE
hi DiffText     ctermfg=16              ctermbg=226             cterm=NONE
hi Directory    guifg=#1600FF           guibg=bg                gui=NONE
hi Directory    ctermfg=21              ctermbg=255             cterm=NONE
hi ErrorMsg     guifg=Red2              guibg=NONE              gui=bold
hi ErrorMsg     ctermfg=160             ctermbg=NONE            cterm=NONE
hi FoldColumn   guifg=LightSteelBlue4   guibg=#F5F5EE           gui=bold
hi FoldColumn   ctermfg=24              ctermbg=252             cterm=NONE
hi Folded       guifg=SteelBlue4        guibg=Gainsboro         gui=italic
hi Folded       ctermfg=24              ctermbg=252             cterm=NONE
hi IncSearch    guifg=white             guibg=red               gui=bold
hi IncSearch    ctermfg=255             ctermbg=160             cterm=NONE
hi LineNr       guifg=#FEFEFC           guibg=LightSteelBlue    gui=NONE
hi LineNr       ctermfg=253             ctermbg=110             cterm=NONE
hi MatchParen   guifg=White             guibg=MediumPurple1     gui=NONE
hi ModeMsg      guifg=White             guibg=tomato            gui=bold
hi MoreMsg      guifg=SeaGreen4         guibg=bg                gui=bold
hi NonText      guifg=LightSteelBlue4   guibg=bg                gui=bold
hi NonText      ctermfg=110             ctermbg=255             cterm=NONE
hi Pmenu        guifg=fg                guibg=azure             gui=NONE
hi Pmenu        ctermfg=fg              ctermbg=195             cterm=NONE
hi PmenuSbar    guifg=White             guibg=PowderBlue        gui=NONE
hi PmenuSbar    ctermfg=255             ctermbg=153             cterm=NONE
hi PmenuSel     guifg=White             guibg=Blue              gui=NONE
hi PmenuSel     ctermfg=255             ctermbg=21              gui=NONE
hi PmenuThumb   guifg=SkyBlue3          guibg=White             gui=reverse
hi PmenuThumb   ctermfg=111             ctermbg=255             gui=NONE
hi Question     guifg=Chartreuse4       guibg=bg                gui=bold
hi SignColumn   guifg=LightSteelBlue4   guibg=#F5F5EE           gui=bold
hi SignColumn   ctermfg=110             ctermbg=254             cterm=NONE
hi Search       guifg=white             guibg=red               gui=NONE
hi Search       ctermfg=255             ctermbg=160             cterm=NONE
hi SpecialKey   guifg=white             guibg=LemonChiffon3     gui=NONE
hi SpecialKey   ctermfg=255             ctermbg=144             cterm=NONE
hi SpellBad     guisp=Firebrick2                                gui=undercurl
hi SpellBad     ctermfg=16              ctermbg=229             cterm=NONE
hi SpellCap     guisp=Blue                                      gui=undercurl
hi SpellCap     ctermfg=16              ctermbg=231             cterm=NONE
hi SpellLocal   guisp=DarkCyan                                  gui=undercurl
hi SpellLocal   ctermfg=16              ctermbg=231             cterm=NONE
hi SpellRare    guisp=Magenta                                   gui=undercurl
hi SpellRare    ctermfg=16              ctermbg=226             cterm=NONE
hi StatusLine   guifg=white             guibg=LightSkyBlue4     gui=NONE
hi StatusLine   ctermfg=255             ctermbg=24              cterm=NONE
hi StatusLineNC guifg=ivory1            guibg=LightSteelBlue    gui=NONE
hi StatusLineNC ctermfg=253             ctermbg=110             cterm=NONE
hi TabLine      guifg=fg                guibg=LightGrey         gui=underline
hi TabLineFill  guifg=fg                guibg=bg                gui=reverse
hi TabLineSel   guifg=fg                guibg=bg                gui=bold
hi Title        guifg=DeepSkyBlue3      guibg=bg                gui=bold
hi Title        ctermfg=75              ctermbg=255             cterm=NONE
hi VertSplit    guifg=ivory1            guibg=LightSkyBlue4     gui=NONE
hi VertSplit    ctermfg=255             ctermbg=24              cterm=NONE
hi Visual       guifg=white             guibg=DeepSkyBlue1      gui=NONE
hi Visual       ctermfg=255             ctermbg=153             cterm=NONE
hi WarningMsg   guifg=Firebrick2        guibg=bg                gui=NONE
hi WildMenu     guifg=Black             guibg=SkyBlue           gui=NONE
hi WildMenu     ctermfg=16              ctermbg=117             cterm=NONE
" }}}

