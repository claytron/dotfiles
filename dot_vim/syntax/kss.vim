" Vim syntax file
" Language: Kukit Style Sheets
" Maintainer:   Godefroid Chapelle <gotcha@bubblenet.be>

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'kss'
endif

syn case ignore

syn keyword cssTagName abbr acronym address applet area a b base
syn keyword cssTagName basefont bdo big blockquote body br button
syn keyword cssTagName caption center cite code col colgroup dd del
syn keyword cssTagName dfn dir div dl dt em fieldset font form frame
syn keyword cssTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe img input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noframes noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script select small
syn keyword cssTagName span strike strong style sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr tt ul u var
syn match cssTagName "\<table\>"
syn match cssTagName "\*"

syn match cssTagName "@page\>" nextgroup=cssDefinition

syn match cssSelectorOp "[+>.]"
syn match cssSelectorOp2 "[~|]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" transparent contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

try
syn match cssHtmlIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
syn match cssIdentifier "[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match cssHtmlIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
syn match cssIdentifier "[A-Za-z_@][A-Za-z0-9_@-]*"
endtry


syn match cssValueInteger contained "[-+]\=\d\+"
syn match cssValueNumber contained "[-+]\=\d\+\(\.\d*\)\="

syn match cssUnicodeRange contained "U+[0-9A-Fa-f?]\+"
syn match cssUnicodeRange contained "U+\x\+-\x\+"

" syn case match
syn region cssURL contained matchgroup=kssFunctionName start="\<url\s*(" end=")" oneline keepend

syn case match
syn region kssFunction contained matchgroup=kssFunctionName start="\<\(nodeAttr\|kssAttr\|formVar\|currentFormVar\|form\|currentForm\|nodeContent\|stateVar\|pass\)\s*(" end=")" oneline keepend contains=cssStringQQ,cssStringQ,cssValue.*

" TODO not implemented in KSS
" syn match cssImportant contained "!\s*important\>"

syn case ignore

" TODO not implemented in KSS
"syn keyword cssUIProp contained cursor
"syn match cssUIProp contained "\<outline\(-\(width\|style\|color\)\)\=\>"
"syn match cssUIAttr contained "\<[ns]\=[ew]\=-resize\>"
"syn keyword cssUIAttr contained default crosshair pointer move wait help
"syn keyword cssUIAttr contained thin thick
"syn keyword cssUIAttr contained dotted dashed solid double groove ridge inset outset
"syn keyword cssUIAttr contained invert

syn region cssInclude start="@import" end=";" contains=cssComment,cssURL,cssUnicodeEscape
syn match cssBraces contained "[{}]"
syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssComment,kssNameValue,cssValue.*,cssURL,cssError,cssStringQ,cssStringQQ,cssUnicodeEscape
syn match cssBraceError "}"

syn match kssEventPseudoClass ":\S*" contains=kssEvent
syn match kssEvent "\S*" contained contains=kssEventId,kssEventInstance,cssUnicodeEscape
syn match kssEventInstance "([^)]\+)" contained transparent contains=cssIdentifier

syn match kssNameValue "[^:]\+:[^;]\+;" contains=kssName,cssValue.*,kssFunction,cssStringQQ,cssStringQ
syn match kssName "[^-]\+-\([^-]\+-\)*[^-:]\+" contained nextgroup=cssValue.* contains=kssActionKeyword,kssEventKeyword,kssEventId,kssEventParam,kssActionLocation,cssIdentifier
syn keyword kssEventKeyword evt nextgroup=kssEventId
syn keyword kssActionKeyword action nextgroup=kssActionLocation


syn keyword kssEventId contained click blur focus resize dblclick mousedown mouseup
syn keyword kssEventId contained mousemove mouseover mouseout change reset select
syn keyword kssEventId contained submit keydown keypress keyup timeout load

syn keyword kssEventParam contained preventdefault allowbubbling initial keycodes

syn keyword kssActionLocation contained server client

syn region cssComment start="/\*" end="\*/"

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\"+ contained
syn match cssSpecialCharQ +\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ

if main_syntax == "css"
  syn sync minlines=10
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cssComment Comment
  HiLink cssTagName Statement
  HiLink cssSelectorOp Special
  HiLink cssSelectorOp2 Special
"  HiLink cssUIProp StorageClass
"  HiLink cssUIAttr Type
  HiLink kssEventId Constant
  HiLink kssEventParam Preproc
  HiLink kssActionLocation Preproc
  HiLink kssActionKeyword Type
  HiLink kssEventKeyword Type
  HiLink kssEvent Normal
  HiLink kssName Type
  HiLink cssValueLength Number
  HiLink cssValueInteger Number
  HiLink cssValueNumber Number
  HiLink cssValueAngle Number
  HiLink cssValueTime Number
  HiLink cssValueFrequency Number
  HiLink cssURL String
  HiLink kssFunctionName Function
  HiLink cssHtmlIdentifier Function
  HiLink cssIdentifier Normal
  HiLink cssInclude Include
"  HiLink cssImportant Special
  HiLink cssBraces Function
  HiLink cssBraceError Error
  HiLink cssError Error
  HiLink cssInclude Include
  HiLink cssUnicodeEscape Special
  HiLink cssStringQQ String
  HiLink cssStringQ String
  HiLink cssUnicodeRange Constant
  delcommand HiLink
endif

let b:current_syntax = "kss"

if main_syntax == 'kss'
  unlet main_syntax
endif


" vim: ts=8


