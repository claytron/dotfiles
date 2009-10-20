syntax region doctest_value start=+^\s\{2,4}+ end=+$+
syntax region doctest_code start=+\s\+[>.]\{3}+ end=+$+
syntax region doctest_literal start=+`\++ end=+`\++

syntax region doctest_header start=+=\+\n\w\++ start=+\w.\+\n=\++ end=+=$+
syntax region doctest_header start=+-\+\n\w\++ start=+\w.\+\n-\++ end=+-$+
syntax region doctest_header start=+\*\+\n\w\++ start=+\w.\+\n\*\++ end=+\*$+

syntax region doctest_note start=+\.\{2} \[+ end=+(\n\n)\|\%$+

hi link doctest_header Statement
hi link doctest_code Special
hi link doctest_value Define
hi link doctest_literal Comment
hi link doctest_note Comment
