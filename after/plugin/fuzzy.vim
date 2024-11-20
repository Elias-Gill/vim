"'finder' without fzf (for some reason)
function! Find()
    cexpr! system('find . -iname "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Find call Find()
