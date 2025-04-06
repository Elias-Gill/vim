if has('win32')
    source $HOME/vimfiles/remaps.vim
else
    source $HOME/.vim/remaps.vim
endif

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

" --- special options ---
set nobackup
set noswapfile
set noundofile
set nolazyredraw
set clipboard^=unnamed,unnamedplus
set ttimeoutlen=50 " solve delay when pressing the <esc> key

" --- mouse ands line numbers ---
set nu rnu
set mouse=a
set mousemodel=extend
set numberwidth=4 
set cursorline

" --- wraping ---
set tw=125
set wrap linebreak
set showbreak=⤷\ \ 
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
set statusline=%\#Normal#\ %\#StatusLineTerm#\ %f\ %m\ %=%l\/%L\ [%p%%]\ %\#Normal#\ 
set guioptions=c
set cmdheight=1
set conceallevel=0
set concealcursor=c

" Do not disturb (t_vb= disables the terminal bell)
set confirm
set hidden
set shortmess+=c
set t_vb=
set background=dark

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" --- better grep and search ---
set ignorecase
set grepformat=%f:%l:%c:%m
if executable('rg')
    "use ripgrep instead of grep if possible
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" Open quickfix when grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow | redraw!
    autocmd QuickFixCmdPost l*    lwindow | redraw!
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
set smartcase

" Borrar buffers sin usar
command Bw :wa | Bwipeout hidden
command W :w
command Q :q

"  ----------------------
" |     netrw options    |
"  ----------------------
"let g:netrw_liststyle = 3
let g:netrw_keepdir = 1
let g:netrw_hide = 1  
let g:netrw_list_hide = '^\.'
let g:netrw_browse_split = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0

"  ----------------------
" |  newer vim versions  |
"  ----------------------
if v:version >= 900
    set wildoptions=pum,fuzzy
    set wildmenu
    set splitkeep=screen
endif

"  ----------------------
" |   plugins section    |
"  ----------------------
" Function to check and install vim-plug
function! ConfigurePlugins()
    if has('win32')
        let plug_path = expand('~/vimfiles/autoload/plug.vim')
        if empty(glob(plug_path))
            let choice = input('vim-plug is not installed. Do you want to install it? (y/n): ')
            if choice ==? 'y'
                silent !powershell -NoProfile -ExecutionPolicy Bypass -Command "New-Item -ItemType Directory -Force -Path '~/vimfiles/autoload'"
                silent !powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile '~/vimfiles/autoload/plug.vim'"
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
                echo 'vim-plug has been installed. Please restart Vim.'
            else
                echo 'vim-plug installation skipped.'
            endif
        endif
    else
        let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
        let plug_path = expand(data_dir . '/autoload/plug.vim')
        if empty(glob(plug_path))
            let choice = input('vim-plug is not installed. Do you want to install it? (y/n): ')
            if choice ==? 'y'
                silent execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
                echo 'vim-plug has been installed. Please restart Vim.'
            else
                echo 'vim-plug installation skipped.'
            endif
        endif
    endif

    " --------- PLUGINS LIST -----------
    call plug#begin()

    " colorscheme
    Plug 'tomasr/molokai'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'sainnhe/gruvbox-material'
    Plug 'drsooch/gruber-darker-vim'

    " navigation
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'roblillack/vim-bufferlist'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Plug 'justinmk/vim-dirvish' " dired like navigation
    Plug 'tpope/vim-vinegar'

    " Utils
    Plug 'preservim/vim-markdown' "alternativa: elias-gill/vim-markdown-concealed
    Plug 'Asheq/close-buffers.vim'
    Plug 'roblillack/vim-bufferlist'
    Plug 'tpope/vim-repeat'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-surround'
    Plug 'szw/vim-maximizer'
    Plug 'preservim/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-fugitive'
    Plug 'chrisbra/colorizer'
    Plug 'vim-utils/vim-man'

    if has("vim9script")
        Plug 'bfrg/vim-qf-preview'
    endif

    call plug#end()
endfunction

" Call the function to check and install vim-plug
call ConfigurePlugins()

" ---- Plugins configuration ----
packadd cfilter
let g:NERDCreateDefaultMappings = 1
let g:indentLine_char_list = ['┊']

let g:gruvbox_material_foreground='mix'
let g:gruvbox_material_better_performance=1
colorscheme oldworld

"hi Normal guibg=NONE
"colorscheme catppuccin_mocha
"colorscheme gruvbox-material
"colorscheme molokai

" Auto close nerdtree
"function Autoclosetree()
    "if winnr('$') == 1 && bufname() =~ 'NetrwTreeListing' . tabpagenr() | quit | endif
"endfunction
"augroup closeTree
    "autocmd BufEnter * call Autoclosetree()
"augroup END

