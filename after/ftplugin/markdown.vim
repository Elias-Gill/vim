setlocal concealcursor=c
setlocal conceallevel=0
setlocal linebreak
setlocal wrap
setlocal tw=0

nnoremap <buffer>k gk
nnoremap <buffer>j gj
nnoremap <buffer>gk k
nnoremap <buffer>gj j
nnoremap <buffer>C cg$

nnoremap <buffer><cr> <Plug>Markdown_EditUrlUnderCursor

vnoremap <buffer>k gk
vnoremap <buffer>j gj
vnoremap <buffer>gk k
vnoremap <buffer>gj j

nnoremap <buffer>^ g^
nnoremap <buffer>$ g$

vnoremap <buffer>^ g^
vnoremap <buffer>$ g$
