" I supose this would be running on a unix machine anyways
source $HOME/.vim/remaps.vim

"  ----------------------
" |   plugins section    |
"  ----------------------
if has('win32')
    if empty(glob('~/vimfiles/autoload/plug.vim'))
        silent !powershell -NoProfile -ExecutionPolicy Bypass -Command "New-Item -ItemType Directory -Force -Path '~/vimfiles/autoload'"
        silent !powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile '~/vimfiles/autoload/plug.vim'"
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

call plug#begin()

" colorscheme
Plug 'tomasr/molokai'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sainnhe/gruvbox-material'

" navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'roblillack/vim-bufferlist'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" better quickfix
Plug 'romainl/vim-qf'

" Utils
Plug 'elias-gill/vim-markdown-concealed'
Plug 'Asheq/close-buffers.vim'
Plug 'roblillack/vim-bufferlist'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
"Plug 'tpope/vim-fugitive'

call plug#end()

" ---- Plugins configuration ----
let g:NERDCreateDefaultMappings = 1

let g:indentLine_char_list = ['┊']

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
set nobackup
set nolazyredraw
set noundofile
set clipboard=unnamedplus
set cmdheight=1
set wildoptions=pum,fuzzy
set wildmenu

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

" --- Visuals ---
set showcmd
set showmode
set scrolloff=4
set termguicolors
set signcolumn=auto
set fillchars=fold:\ 
set fillchars+=diff:╱
set fillchars+=vert:│
set completeopt=menuone,noselect
set laststatus=2

"colorscheme
set background=dark
"colorscheme catppuccin_mocha
"colorscheme molokai

let g:gruvbox_material_foreground='mix'
let g:gruvbox_material_better_performance=1
colorscheme gruvbox-material

" Mini colors customization
"hi VertSplit guibg=NONE
"hi Normal guibg=NONE
hi MatchParen guibg=#585858
hi VertSplit guifg=#585858
hi EndOfBuffer guifg=#585858

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" --- better grep and search ---
set grepformat=%f:%l:%c:%m
if executable('rg')
    "use ripgrep instead of grep if possible
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" Open quickfix when grep
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

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

function Autoclosetree()
    if winnr('$') == 1 && bufname() =~ 'NERD_tree_' . tabpagenr() | quit | endif
endfunction
augroup closeTree
    autocmd BufEnter * call Autoclosetree()
augroup END
