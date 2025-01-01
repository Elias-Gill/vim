" A dictionary to store the harpooned files
let g:harpoon_files = []
let g:harpoon_index = 0

" Function to add the current file to the harpoon list
function! HarpoonAdd()
    let l:current_file = expand('%:p')
    if index(g:harpoon_files, l:current_file) == -1
        call add(g:harpoon_files, l:current_file)
        echo "Harpooned: " . l:current_file
    else
        echo "File is already harpooned"
    endif
endfunction

" Function to open the harpoon buffer
function! HarpoonList()
    let l:bufname = "__harpoon_list__"
    if bufexists(l:bufname)
        execute 'buffer' bufname(l:bufname)
    else
        execute 'enew'
        setlocal buftype=nofile
        setlocal bufhidden=wipe
        setlocal nobuflisted
        setlocal nowrap
        setlocal noswapfile
        execute 'file' l:bufname
        call HarpoonRefreshBuffer()
    endif
endfunction

" Function to refresh the harpoon buffer content
function! HarpoonRefreshBuffer()
    let l:bufname = "__harpoon_list__"
    if bufexists(l:bufname)
        call setbufline(bufname(l:bufname), 1, map(copy(g:harpoon_files), 'v:val'))
        execute 'silent! %delete _'
        call setbufline(bufname(l:bufname), 1, map(copy(g:harpoon_files), 'v:val'))
    endif
endfunction

" Function to save changes from buffer back to the list
function! HarpoonSaveBuffer()
    let l:bufname = "__harpoon_list__"
    if bufexists(l:bufname)
        let g:harpoon_files = getline(1, '$')
    endif
endfunction

" Function to cycle to the next harpooned file
function! HarpoonNext()
    if len(g:harpoon_files) == 0
        echo "No harpooned files"
        return
    endif
    let g:harpoon_index = (g:harpoon_index + 1) % len(g:harpoon_files)
    execute 'edit' fnameescape(g:harpoon_files[g:harpoon_index])
endfunction

" Function to cycle to the previous harpooned file
function! HarpoonPrev()
    if len(g:harpoon_files) == 0
        echo "No harpooned files"
        return
    endif
    let g:harpoon_index = (g:harpoon_index - 1 + len(g:harpoon_files)) % len(g:harpoon_files)
    execute 'edit' fnameescape(g:harpoon_files[g:harpoon_index])
endfunction

" Keybindings for Harpoon
nnoremap <leader>hh :call HarpoonAdd()<CR>
nnoremap <leader>hu :call HarpoonList()<CR>
nnoremap <leader>' :call HarpoonNext()<CR>
nnoremap <leader>; :call HarpoonPrev()<CR>

" Actions to save the buffer
autocmd BufWritePost __harpoon_list__ call HarpoonSaveBuffer()
autocmd BufLeave __harpoon_list__ call HarpoonSaveBuffer()
