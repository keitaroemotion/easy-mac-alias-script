"
" XXX 
"
"
"let number = 1
"let array  = [1, 2, 3, 4, 5]
"
"function! Iterate(array)
"    for i in a:array
"        echo i
"    endfor
"    return 0
"endfunction
"
"let result = Iterate(array)
"execute ":normal o" . "aaa"
"
"command! Iter call Iterate(array)
"
"
echo ">>>"
let c = getchar()
echo nr2char(c)
