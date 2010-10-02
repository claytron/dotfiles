" Vim syntax file
" Language:     Good old CFG files (and buildout too!)
" Maintainer:   Igor N. Prischepoff (igor@tyumbit.ru, pri_igor@mail.ru),
"               Clayton Parker (robots@claytron.com)
" Last change:  2010 Apr 10
" Updates:
"     - now supports buildout ini syntax
"       - Multi-line values
"       - variable substitution
"       - section extending
"     - Spell checking in comments only
"     - Forces check for some items to have no whitespace at the beginning of
"       the line, this may be a buildout/ConfigParser specific thing

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists ("b:current_syntax")
    finish
endif

" case off
syn case ignore
syn keyword CfgOnOff  ON OFF YES NO TRUE FALSE  contained
syn match UncPath "\\\\\p*" contained
"Dos Drive:\Path
syn match CfgDirectory "[a-zA-Z]:\\\p*" contained

" The section reference in a varible substitution
syn match CfgVarSubSection "\${[^:]*:"ms=s+2,me=e-1 contained

" variable substitution in buildout
syn match CfgVariableSub "\${[^}]*}" contained contains=CfgVarSubSection

"Parameters
syn match   CfgParams    "^[^ ].*="me=e-1 contains=CfgComment
"... and their values (don't want to highlight '=' sign)
syn match   CfgValues    "=.*"hs=s+1 contains=CfgDirectory,UncPath,CfgString,CfgOnOff,CfgVariableSub
" in buildout anything that starts with a space is a value
syn match   CfgMultiValues    "^ .*" contains=CfgDirectory,UncPath,CfgString,CfgOnOff,CfgVariableSub

" Buildout's section extension syntax
syn match CfgExtendSection "^<=.*"

" Sections
syn match CfgSection        "^\[.*\]"
syn match CfgSection        "^{.*}"

" String
syn match  CfgString    "\".*\"" contained
syn match  CfgString    "'.*'"   contained

" Comments (Everything before '#' or '//' or ';')
syn match  CfgComment   "^#.*" contains=@Spell
syn match  CfgComment   ";.*" contains=@Spell
syn match  CfgComment   "\/\/.*" contains=@Spell

" set up folding
syn region CfgFoldingSection start="^\[" end="\(\n\+\[\)\@=" contains=ALL keepend fold

" Define the default hightlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cfg_syn_inits")
    if version < 508
        let did_cfg_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink CfgOnOff     Label
    HiLink CfgComment   Comment
    HiLink CfgSection   Type
    HiLink CfgString    String
    HiLink CfgParams    Keyword
    HiLink CfgValues    Constant
    HiLink CfgMultiValues Constant
    HiLink CfgVariableSub Title
    HiLink CfgVarSubSection Title
    HiLink CfgExtendSection Identifier
    HiLink CfgDirectory Directory
    HiLink UncPath      Directory

    delcommand HiLink
endif
let b:current_syntax = "cfg"
" vim:ts=8
