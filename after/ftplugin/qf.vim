"remaps for the QuickFix list
nnoremap <buffer> <Cr> <Cr>
nnoremap <buffer> q :q<cr>
nnoremap <buffer> <backspace> :BqfAutoToggle<cr>
nnoremap <buffer> [q :colder<cr>
nnoremap <buffer> ]q :cnewer<cr>

nnoremap <buffer> f :Cfilter 
nnoremap <buffer> F :Cfilter! 
nnoremap <buffer> p <plug>(qf-preview-open)
