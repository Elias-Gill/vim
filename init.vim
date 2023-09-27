"  ----------------------
" |   plugins section    |
"  ----------------------
" automatic install of vim PLUG
let g:dotvim = '...'
if empty(glob(g:dotvim . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . g:dotvim . '/autoload/plug.vim --create-dirs '
                \ . '"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" I supose this would be running on a unix machine anyways
source $HOME/.vim/config/remaps.vim
call plug#begin()

" colorscheme
Plug 'morhetz/gruvbox'

" navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'roblillack/vim-bufferlist'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Utils
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'

call plug#end()

"  ----------------------
" |   general options    |
"  ----------------------
" --- folding ---
set nofoldenable
set foldmethod=syntax
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
set foldtext=CustomFoldText()
function! CustomFoldText()
    let indentation = indent(v:foldstart - 1)
    let linetext = substitute(getline(v:foldstart),"^ *","",0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let expansionString = repeat(" ", indentation)
    return expansionString . foldLevelStr . linetext . foldSizeStr
endfunction

" --- indentation ---
set diffopt+=vertical
set nolist
set smartindent
set autoindent

" --- specials & do not disturb ---
set confirm
set hidden
set shortmess+=c
set undofile
set jumpoptions=stack
set clipboard+=unnamedplus
set cmdheight=1

" --- mouse ands line numbers ---
set nu rnu
set mouse=a
set mousemodel=extend
set numberwidth=4 
set cursorline

" --- wraping ---
set tw=125
set wrap linebreak
set colorcolumn=90
set splitbelow splitright
set splitkeep=screen

" --- Visuals ---
set showcmd
set showmode
set scrolloff=4
set termguicolors
set signcolumn=yes
set fillchars=fold:\ 
set fillchars+=diff:╱
set completeopt=menuone,noselect
set laststatus=2
colorscheme gruvbox

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" --- Tabs to spaces ---
set tabstop=4 softtabstop=4
set expandtab
set sw=4

" --- For plug-ins to load correctly. ---
filetype plugin indent on
set backspace=indent,eol,start
set encoding=utf-8

" --- search settings ---
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" Borrar buffers sin usar
command Bw :wa | Bwipeout hidden
command W :w
command Q :q

"  ----------------------
" |     netrw options    |
"  ----------------------
File browsing options
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0
let g:netrw_hide = 1  
let g:netrw_list_hide = '^\.'
let g:netrw_browse_split = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0

" Mappings
augroup netrw_mappings
    autocmd!
    autocmd filetype netrw noremap <silent><buffer> <C-r> <Nop>
    autocmd filetype netrw noremap <silent><buffer> <C-r> <C-l>

    " autocmd filetype netrw noremap <silent><buffer> <C-l> <Nop>
    autocmd filetype netrw nnoremap <silent><buffer> <C-l> :wincmd l<cr>

    autocmd filetype netrw noremap <silent><buffer> a <Nop>
    autocmd filetype netrw nnoremap <silent><buffer> q :q<cr>
augroup END

" Auto-close on exit
lua << EOF
vim.api.nvim_create_autocmd("BufEnter", {
    command = "if winnr('$') == 1 && &filetype =~ 'netrw' | quit | endif",
nested = true,
})
EOF
