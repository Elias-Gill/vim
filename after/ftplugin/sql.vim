" SQL Runner for PostgreSQL
let s:sql = {
    \ 'db': '',
    \ 'user': get(g:, 'sql_default_user', 'postgres'),
    \ 'is_vim': 1,
    \ 'tmp_file': '/tmp/vim_sql_query.sql'
\ }

function! s:sql.list_databases() abort
    " Comando más robusto para listar bases de datos
    let l:cmd = "psql -U " . shellescape(s:sql.user) . " -lt --no-align --tuples-only | cut -d'|' -f1 | sed -e 's/ //g' | grep -v '^$' | grep -v '^template[0-9]' | grep -v '^postgres$'"
    
    " Ejecutar y manejar errores
    let l:databases = systemlist(l:cmd)
    
    if v:shell_error
        echoerr 'Error al listar bases de datos: ' . v:shell_error
        echoerr 'Comando fallido: ' . l:cmd
        return []
    endif
    
    if empty(l:databases)
        echoerr 'No se encontraron bases de datos'
        return []
    endif
    
    " Filtrar resultados vacíos o inválidos
    let l:filtered = filter(copy(l:databases), 'v:val !~ "^\\s*$" && v:val != "template0" && v:val != "template1"')
    
    if empty(l:filtered)
        echoerr 'No hay bases de datos disponibles'
        return []
    endif
    
    return l:filtered
endfunction

function! s:sql.select_database() abort
    let l:dbs = s:sql.list_databases()
    if empty(l:dbs)
        return
    endif

    let l:output = ["Select database:"]
    let l:counter = 1
    for db in l:dbs
        call add(l:output, printf('%2d. %s', l:counter, db))
        let l:counter += 1
    endfor
    call add(l:output, '')

    let l:choice = input(join(l:output, "\n") . 'Database number or name: ')
    let l:choice = trim(l:choice)

    if l:choice =~ '^\d\+$'
        let l:index = str2nr(l:choice) - 1
        if l:index >= 0 && l:index < len(l:dbs)
            let s:sql.db = l:dbs[l:index]
        else
            echoerr 'Selección inválida'
        endif
    elseif index(l:dbs, l:choice) >= 0
        let s:sql.db = l:choice
    else
        echoerr 'Nombre inválido de base de datos'
    endif
endfunction

function! s:sql.open_result_file() abort
    let l:result_file = '/tmp/vim_sql_result.txt'
    
    " Abrir el archivo en modo solo lectura
    execute 'silent! vsplit | view ' . l:result_file
    setlocal readonly
    setlocal nomodifiable

    " Subrayar toda la línea que contiene 'ERROR'
    match DiagnosticError '.*ERROR.*'
endfunction

function! s:sql.change_user() abort
    let s:sql.user = input('PostgreSQL username: ', s:sql.user)
endfunction

function! s:sql.execute(file) abort
    echom "Ejecutando archivo: " . a:file

    if empty(s:sql.db)
        call s:sql.select_database()
        if empty(s:sql.db)
            return
        endif
    endif

    let l:result_file = '/tmp/vim_sql_result.txt'
    let l:cmd = printf('psql -U %s -d %s -a -f %s > %s 2>&1',
                \ shellescape(s:sql.user),
                \ shellescape(s:sql.db),
                \ shellescape(a:file),
                \ shellescape(l:result_file))

    call system(l:cmd)

    if v:shell_error
        echoerr 'Error al ejecutar el script SQL'
    endif

    " Abrir el archivo de resultado en un split vertical
    call s:sql.open_result_file()
endfunction

" Command definitions
command! -buffer -range=% SqlRunSelection '<,'>write! /tmp/vim_sql_query.sql & call s:sql.execute(s:sql.tmp_file) 
command! -buffer SqlRunFile call s:sql.execute(expand('%'))
command! -buffer SqlChangeUser call s:sql.change_user()
command! -buffer SqlChangeDB call s:sql.select_database()
command! -buffer SqlLogs call s:sql.open_result_file()

" Key mappings
nnoremap <buffer> <leader>sr :SqlRunFile<CR>
vnoremap <buffer> <leader>sr :SqlRunSelection<CR>
nnoremap <buffer> <leader>sl :SqlLogs<CR>
