" Vim syntax file
" Language:     DrProject Wiki, http://drproject.org
" Maintainer:   David Wolever <david@wolever.net>
" Home:         http://wolever.net/~wolever/drpwiki.vim
" Author:       David Wolever, based on FlexWiki syntax highlighting by George V. Reilly
" Last Change:  Wed Aug 15 16:12:55 EDT 2007
" Version:      0.1
" Bugs:         Lots of them.  Really.  I'm sure you'll find them.

" Installing:   Save to ~/.vim/syntax/
" Using:        Use :set filetype=drpwiki

" Quit if syntax file is already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" First, match any escaped word
syntax match  drpwikiEscaped       /![A-Za-z#@\[].\{-}\>/

" CamelCase word
syntax match  drpwikiWord          /\<\(\(wiki:\)\?[A-Z][a-z0-9%#]\+\([A-Z][a-z0-9%#]\+\)\+\>\)\>/
" A [bracketed wiki word] (short_link in formatter.py)
syntax match  drpwikiWord          /\[[A-Za-z0-9_.+-]\+:\('[^']\+'\|"[^"]\+"\|[A-Za-z0-9_/?!#@]\([^|<>]*[a-zA-Z0-9/=]\)\?\)\]/
" Ticket link: #123 or ticket:123
syntax match  drpwikiWord          /\(\#\|ticket:\)[0-9]\+\>/
" Mail message: @123@ or mail:123
syntax match  drpwikiWord          /@[0-9]\+@/
syntax match  drpwikiWord          /mail:[0-9]\+\>/
" Changeset link: [123] or changeset:1 or [1:2] or r2 or r3:5
syntax match  drpwikiWord          /changeset:[0-9]\+\>/
syntax match  drpwikiWord          /\[[0-9]\+\(:[0-9]\+\)*\]/
syntax match  drpwikiWord          /\<r[0-9]\+\(:[0-9]\+\)*/
" Milestone link: milestone:1.23, milestone:foostone
syntax match  drpwikiWord          /milestone:[a-zA-Z0-9.]\+/
" File link: source:trunk/foo
" Specific file revison: source:trunk/foo#123
syntax match  drpwikiWord          /source:[a-zA-Z0-9./#@]\+/

" text: "this is a link (optional tooltip)":http://www.microsoft.com
" TODO: check URL syntax against RFC
syntax match drpwikiLink           `\(\(https\?\|ftp\|gopher\|telnet\|file\|notes\|ms-help\):\(\(\(//\)\|\(\\\\\)\)\+[A-Za-z0-9:#@%/;$~_?+-=.&\-\\\\]*\)\)`

" ''italic''
syntax region drpwikiItalic         start="''" end="''"

" '''bold'''
syntax region drpwikiBold           start="'''" end="'''"

" '''''bold italic'''''
syntax region drpwikiBoldItalic     start="'''''" end="'''''"

" text: __underlined__
syntax region drpwikiUnderline      start="__" end="__"

" text: ``code`` 
syntax region drpwikiCode           start="``" end="``"

"   text: ~~deleted text~~ 
syntax region drpwikiDelText        start="\~\~" end="\~\~"

"   text: ^superscript^ 
syntax region drpwikiSuperScript    start="\^" end="\^"

"   text: ,,subscript,, 
syntax region drpwikiSubScript      start=",," end=",,"

"   macros: [[SomeMacro]]
syntax region drpwikiMacro          start="\[\[" end="\]\]"

" Aggregate all the regular text highlighting into drpwikiText
syntax cluster drpwikiText contains=drpwikiEscaped,drpwikiItalic,drpwikiBold,drpwikiCode,drpwikiDelText,drpwikiSuperScript,drpwikiSubScript,drpwikiLink,drpwikiWord,drpwikiBoldItalic,drpwikiMacro

" single-line WikiPropertys
syntax match drpwikiSingleLineProperty /^:\?[A-Z_][_a-zA-Z0-9]\+:/

" TODO: multi-line WikiPropertys

" Header levels, 1-6
syntax match drpwikiH1             /^=.*=$/
syntax match drpwikiH2             /^==.*==$/
syntax match drpwikiH3             /^===.*===$/
syntax match drpwikiH4             /^====.*====$/
syntax match drpwikiH5             /^=====.*====$/
syntax match drpwikiH6             /^======.*=====$/

" <hr>, horizontal rule
syntax match drpwikiHR             /^---.*$/

" Bulleted list items start with one space or tabs, followed by whitespace, then '*'
" Numeric  list items start with one space or tabs, followed by whitespace, then '#'
" Eight spaces at the beginning of the line is equivalent to the leading tab.
syntax match drpwikiList           /^[ \t]\+\(\*\|#\|[0-9]\+\.\) .*$/   contains=@drpwikiText

" Also handle {{{ }}} preformatted text
syntax region drpwikiPre           start="{{{" end="}}}" 

" Link FlexWiki syntax items to colors
hi def link drpwikiH1                    Title
hi def link drpwikiH2                    drpwikiH1
hi def link drpwikiH3                    drpwikiH2
hi def link drpwikiH4                    drpwikiH3
hi def link drpwikiH5                    drpwikiH4
hi def link drpwikiH6                    drpwikiH5
hi def link drpwikiHR                    drpwikiH6
    
hi def drpwikiBold                       term=bold cterm=bold gui=bold
hi def drpwikiItalic                     term=italic cterm=italic gui=italic
hi def drpwikiBoldItalic                 term=underline cterm=underline gui=underline
hi def drpwikiUnderline                  term=underline cterm=underline gui=underline

hi def link drpwikiCode                  Statement
hi def link drpwikiWord                  Underlined

hi def link drpwikiPre                   PreProc
hi def link drpwikiLink                  Underlined
hi def link drpwikiList                  Type
hi def link drpwikiEmoticons             Constant
hi def link drpwikiDelText               Comment
hi def link drpwikiSuperScript           Constant
hi def link drpwikiSubScript             Constant
hi def link drpwikiMacro                 Type

hi def link drpwikiSingleLineProperty    Identifier

let b:current_syntax="DrProjectWiki"

" vim:tw=0:
