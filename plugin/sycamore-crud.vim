" Version 1.0 - Feb 16 2016
" git@github.com:JRonhovde/vim-sycamore-crud.git
if exists('g:loaded_sycamore_crud_plugin')
    finish
endif
let g:loaded_sycamore_crud_plugin = 1

function! SycamoreCrud(...)
    let start = line("'<")
    let stop = line("'>")
    let current = start
    let quotes = '"'."'"

    let objName = matchstr(getline(current), '\v\zs\$[^,) =>]+\ze *\) *\{') 
    if(len(objName) == 0)
        let objName = '$crudObj'
    endif
    let current += 1

    while current <= stop
        let leader = 'silent! ' . current . ',' . current
        let line = getline(current)
        execute leader . 's/\vmysql_result\([^'.quotes.']+['.quotes.'](.*)['.quotes.']/'.objName.'->get("\L\1"/'
        "echo leader . 's/\vmysql_result([^'.quotes.']+'.quotes.'(.*)'.quotes.'/'.objName.'->get("\1"/'
        let current += 1
    endwhile
endfunction

command! -range -nargs=* SycamoreCrud call SycamoreCrud(<f-args>)
command! -range -nargs=* SCrud call SycamoreCrud(<f-args>)
