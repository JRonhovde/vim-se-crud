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

    let aliases = {}
    let g:filePath = '/usr/local/bin/crudaliases.txt'
    let contents = readfile(fnameescape(g:filePath))
    for line in contents
        let aliasList = matchlist(line,'\v"([^"]+)" *: *"=([^",]+)"=')
        if index(aliasList,'') == 3
            let aliases[aliasList[1]] = aliasList[2]
        endif
    endfor

    let objName = matchstr(getline(current), '\v\zs\$[^,) =>]+\ze *\) *\{') 
    if(len(objName) == 0)
        let objName = '$crudObj'
    endif
    let current += 1

    while current <= stop
        let leader = 'silent! ' . current . ',' . current
        let line = getline(current)
        let resList = matchlist(line, '\v^.*\= *mysql_result\([^'.quotes.']+['.quotes.'](.*)['.quotes.'] *\);')
        if len(resList) > 1
            let column = tolower(resList[1])
            if has_key(aliases, column)
                let column = aliases[column]
            endif

            execute leader . 's/\vmysql_result\([^'.quotes.']+['.quotes.'](.*)['.quotes.']/'.objName.'->get("'.column.'"/'
            "echo leader . 's/\vmysql_result([^'.quotes.']+'.quotes.'(.*)'.quotes.'/'.objName.'->get("\1"/'
        endif
        let current += 1
    endwhile
endfunction

command! -range -nargs=* SycamoreCrud call SycamoreCrud(<f-args>)
command! -range -nargs=* SCrud call SycamoreCrud(<f-args>)
