let mapleader = " "
let g:terminal_path = getcwd()

inoremap <C-\> <C-w>
nnoremap U <C-r> 

"saving files and exit vim
nnoremap <leader>wf :w!<CR> 
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qf :q!<CR>
nnoremap <leader>qq :q<CR>
"save all buffers and quit
nnoremap <leader>tt :Bw<cr> :qa<cr> 

"file fuzzy searching
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><leader>f :RG<CR>
nnoremap <silent><leader>of :History<CR>
nnoremap gR :Rg <c-r><c-w><cr>
vnoremap gR y:Rg <c-r><c-w><cr>

nnoremap <silent><C-p> :Files<CR>

"usefull grep mappings
"nnoremap <leader>f :silent vimgrep! 
nnoremap gr :silent grep! <c-r><c-w> <cr>
vnoremap gr y:silent grep! /<c-r>"/ <cr>

"file managers
nnoremap <silent><leader>nt :Lexplore<CR>

"cicling buffers
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>
map <silent><leader>bl :call BufferList()<CR>

"cicling quickfix
nnoremap <expr><silent><leader>co empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>:lclose<CR>'
nnoremap <expr><silent><leader>lo empty(filter(getwininfo(), 'v:val.quickfix')) ? ':lopen<CR>' : ':lclose<CR>:cclose<CR>'
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

"nnoremap <leader>; <Plug>(qf_qf_previous)
"nnoremap <leader>' <Plug>(qf_qf_next)

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>rn :%s/
vnoremap <leader>rn :s/

"rename utils
nnoremap <leader>rw yiw:%s/<c-r>"//g<left><left>
vnoremap <leader>rw y:%s/<c-r>"//g<left><left>

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>

"centrar en saltos
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-t> <C-t>zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

"primeagen cool remap to move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

"epic delete/paste utility
vnoremap <leader>p "_dP
nnoremap <leader>p "_dP
vnoremap <leader>d "_dD
nnoremap x "_x
"copy and paste with center and indent
vnoremap y ygv<esc>
nnoremap p p=`]

"increments a decrements
"nnoremap + <C-a>
"nnoremap - <C-x>

"teclas arriba y abajo en insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>

"Moverse entre splits
nnoremap <silent><C-j> :TmuxNavigateDown<cr>
nnoremap <silent><C-k> :TmuxNavigateUp<cr>
nnoremap <silent><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent><C-l> :TmuxNavigateRight<cr>

"Crear splits unificado con Tmux
nnoremap <silent><C-w>\ :vsplit<cr>
nnoremap <silent><C-w>- :split<cr>

"maximizer
nnoremap <leader>mt :MaximizerToggle<cr>

"Archivos de configuracion
nnoremap <leader>cd :cd %:h <CR>
nnoremap <silent><leader>SO :e $MYVIMRC<CR>
nnoremap <silent><leader>so :so $MYVIMRC<CR>
if has('win32')
    nnoremap <silent><leader>sm :e $HOME/vimfiles/remaps.vim<CR>
else 
    nnoremap <silent><leader>sm :e ~/.vim/remaps.vim<CR>
endif

"block the arrow keys
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>

"resize splits with arrow keys
nnoremap <silent><up> :resize +5<CR>
nnoremap <silent><down> :resize -5<CR>
nnoremap <silent><left> :vertical resize -5<CR>
nnoremap <silent><right> :vertical resize +5<CR>

" NerdComments
nnoremap <silent>gcc <plug>NERDCommenterToggle
nnoremap <silent>gcb <plug>NERDCommenterMinimal
vnoremap <silent>gc <plug>NERDCommenterToggle
vnoremap <silent>gb <plug>NERDCommenterMinimal
