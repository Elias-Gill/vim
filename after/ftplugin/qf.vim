"remaps for the QuickFix list
nnoremap <buffer> <Cr> <Cr>
nnoremap <buffer> q :q<cr>
nnoremap <buffer> <backspace> :BqfAutoToggle<cr>
nnoremap <buffer> [q :colder<cr>
nnoremap <buffer> ]q :cnewer<cr>

nnoremap <buffer> p <plug>(qf-preview-open)
if v:version >= 700
    nnoremap <buffer> f :Cfilter 
    nnoremap <buffer> F :Cfilter! 
else
    nnoremap <buffer> f :echo 'Cfilter not available' <cr>
    nnoremap <buffer> F :echo 'Cfilter not available' <cr>
endif
