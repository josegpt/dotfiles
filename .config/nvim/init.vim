""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug for managing plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Boostrap Installation
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" set the runtime path to include vim-plug and initialize it
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged') " required all plugins must appear after this line

" => automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My Pluggins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'sheerun/vim-polyglot'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on        

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap kk <ESC>
let mapleader = " " 

" source file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" move lines in v-mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable arrow keys (Vim don't need this)
let g:hardtime_default_on = 1

" GoTo code navigation.
inoremap <silent><expr> <C-space> coc#refresh()
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart<CR>

" Git Fugitive 
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax Styling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try                   
  syntax on
catch | endtry
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=0
set noshowmode
set shortmess+=c
set noshowcmd
set noruler
set cmdheight=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tabs and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set hidden
set autoread
set noerrorbells
set history=100
set hlsearch
set incsearch
set ttyfast
set wildmenu
set number relativenumber
set nu rnu
set nowrap 
set smartcase
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
set nobackup
set nowritebackup
set updatetime=50

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif