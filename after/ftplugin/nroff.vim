function Compile()
    let fn = expand("%:p")
    let bnumber = bufnr(fn)
    call job_start("groff -ms -rPS=12 -T pdf -f ARI -dpaper=a4 " .'"'.fn.'"'. " > entrega.pdf")
endfunction

nnoremap <buffer>=f :call Compile()<cr>
