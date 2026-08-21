" Make the clipboard work
set clipboard=unnamed

" Handle custom mode cancel
imap jk <Esc>

" Make g_ work as expected
vmap g_ $

" Splitting windows
exmap split_vertical obcommand workspace:split-vertical
exmap split_horizontal obcommand workspace:split-horizontal
nmap <C-w>| :split_vertical<CR>
nmap <C-w>- :split_horizontal<CR>

" Moving through recent edits like in vim
exmap back obcommand app:go-back
exmap forward obcommand app:go-forward
nmap <C-o> :back<CR>
nmap <C-i> :forward<CR>

" Surround config from plugin README
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_double_tilde surround ~~ ~~
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
nunmap S
vunmap S
map s" :surround_double_quotes<CR>
map S" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map S' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map S` :surround_backticks<CR>
map s~ :surround_double_tilde<CR>
map S~ :surround_double_tilde<CR>
map s( :surround_brackets<CR>
map S( :surround_brackets<CR>
map s) :surround_brackets<CR>
map S) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map S[ :surround_square_brackets<CR>
map s[ :surround_square_brackets<CR>
map S[ :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map S{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>
map S} :surround_curly_brackets<CR>
