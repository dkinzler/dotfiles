call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ycm-core/youcompleteme'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'bkad/CamelCaseMotion'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

set ignorecase
set smartcase

syntax enable
set relativenumber
set ruler
set cursorline
filetype indent on

set showmatch
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set wildmenu
set wildmode=longest,list,full

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula highlight Normal cterm=NONE ctermbg=0
augroup END

colorscheme dracula 

let g:airline_powerline_fonts=1
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled=1
let g:camelcasemotion_key = ','

filetype plugin indent on

" use alt+d/u instead of ctrl+d/u to move down/up half screen
execute "set <M-d>=\ed"
execute "set <M-u>=\eu"
nmap <M-d> <C-d><CR>
nmap <M-u> <C-u><CR>