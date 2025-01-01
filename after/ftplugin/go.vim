function! FormatWithGofmtAndRestoreLine()
    let l:current_line = line('.')
    execute 'w'
    execute 'silent %!gofmt %'
    execute l:current_line
endfunction

" Map the function to a keybinding for easier use (optional)
nnoremap <buffer>=f :call FormatWithGofmtAndRestoreLine()<CR>
