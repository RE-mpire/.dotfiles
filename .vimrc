syntax on
set modelines=0
set number
set relativenumber
set colorcolumn=80
set ruler
set nowrap

set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set expandtab
set shiftround

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set hidden
set laststatus=2

set showcmd
set background=dark

augroup numbertoggle
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END