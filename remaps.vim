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
nnoremap <silent><C-p> :FZF<CR>
nnoremap <leader>f :silent grep! 
nnoremap <leader>F :vimgrep! 

"file managers
nnoremap <silent><leader>nt :NERDTreeToggle<CR>

"cicling buffers
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>

"cicling quickfix
nnoremap <leader>' :cnext<CR>
nnoremap <leader>co :copen<CR>
nnoremap <leader>; :cprevious<CR>

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>lp :%s/
vnoremap <leader>lp :s/

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>

"centrar en saltos
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-t> <C-t>zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" nnoremap <C-d> zz<C-d>zz
" nnoremap <C-u> zz<C-u>zz

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
nnoremap + <C-a>
nnoremap - <C-x>

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
nnoremap <silent><leader>sm :e ~/.vim/remaps.vim<CR>
nnoremap <silent><leader>so :so $MYVIMRC<CR>

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
