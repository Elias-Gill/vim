"'finder' without fzf (for some reason)
function! Fuzzy()
    cexpr! system('find . -name "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Fuzzy call Fuzzy()

function! Find()
    exec 'silent vimgrep! "' . input('Pattern: ') . '" **'
endfunction

function! GFind()
    exec 'silent grep! "' . input('Pattern: ') . '" **'
endfunction

command Find call Find()
command GFind call GFind()
