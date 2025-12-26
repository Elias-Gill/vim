source $MYVIMDIR/remaps.vim

" --- folding ---
set nofoldenable
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
set foldmethod=indent
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
set diffopt=vertical,internal,filler,closeoff,inline:simple,linematch:40
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
set exrc
set secure

" --- mouse ands line numbers ---
set nu rnu
set mouse=a
set mousemodel=extend
set numberwidth=4 
set cursorline

" --- wraping ---
set tw=95
set wrap linebreak
set showbreak=⤷\ \ 
set colorcolumn=80
set splitbelow splitright

" --- Visuals ---
set showcmd
set showmode
set scrolloff=4
set termguicolors
set signcolumn=yes
set fillchars=fold:\ 
set fillchars+=diff:╱
set fillchars+=vert:│
set completeopt=menuone,noselect,fuzzy,preview
set complete=.,w,b,u,t
set laststatus=2
set statusline=%\#Normal#\ %\#StatusLineTerm#\ %f\ %m\ \%r\ %=%l\/%L\ [%p%%]\ %\#Normal#\ 
set guioptions=c "Especifico para Gvim
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
set ignorecase smartcase

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
if v:version >= 700
    packadd cfilter
endif
if v:version >= 900
    set wildoptions=pum,fuzzy
    set wildmenu
    set smoothscroll "enhances wrap navigation
    set splitkeep=screen
    packadd editorconfig
endif

"  ----------------------
" |   plugins section    |
"  ----------------------
" Function to check and install vim-plug
function! ConfigurePlugins()
    " Determine autoload path using $MYVIMDIR
    let s:vimdir = expand('$MYVIMDIR')
    let s:plug_path = s:vimdir . '/autoload/plug.vim'

    if empty(glob(s:plug_path))
        let choice = input('vim-plug is not installed. Do you want to install it? (y/n): ')
        if choice ==? 'y'
            if has('win32')
                silent execute '!powershell -NoProfile -ExecutionPolicy Bypass -Command "New-Item -ItemType Directory -Force -Path ''' . s:vimdir . '/autoload''"'
                silent execute '!powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing ''https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'' -OutFile ''' . s:plug_path . '''"'
            else
                silent execute '!curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            endif
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
            echo 'vim-plug has been installed. Please restart Vim.'
        else
            echo 'vim-plug installation skipped.'
        endif
    endif

    " --------- PLUGINS LIST -----------
    call plug#begin()

    " navigation
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'roblillack/vim-bufferlist'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-vinegar'
    "Plug 'justinmk/vim-dirvish' " dired like navigation

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
    Plug 'preservim/vim-markdown'
    Plug 'machakann/vim-highlightedyank'

    if has("vim9script")
        Plug 'bfrg/vim-qf-preview'
    endif

    call plug#end()
endfunction

" Call the function to check and install vim-plug
call ConfigurePlugins()

" ---- Plugins configuration ----
let g:NERDCreateDefaultMappings = 1
let g:indentLine_char_list = ['┊']

let g:gruvbox_material_foreground='mix'
let g:gruvbox_material_better_performance=1

colorscheme oldworld

" Make C syntax highlight to use c99 standar
let c_no_curly_error = 1

" Make markdown no to conceal text
let g:markdown_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Yank highlight
let g:highlightedyank_highlight_duration = 160
highlight HighlightedyankRegion cterm=reverse gui=reverse
