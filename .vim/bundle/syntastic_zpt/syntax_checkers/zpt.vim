"============================================================================
"File:        zpt.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  claytron
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_zpt_syntax_checker")
    finish
endif
let loaded_zpt_syntax_checker = 1

"bail if the user doesnt have tidy or grep installed
if !executable("zptlint")
    finish
endif

function! SyntaxCheckers_zpt_GetLocList()
    let makeprg="zptlint ".shellescape(expand('%'))
    let errorformat='%-P*** Error in: %f,%Z%*\s\, at line %l\, column %c,%E%*\s%m,%-Q'
    let loclist = SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
    return loclist
endfunction
