" UI Tweaks
syntax on
set modelines=0         " Disable modelines
set number
set relativenumber
set colorcolumn=80
set ruler
set nowrap
set laststatus=2        " Always show the status line, even with only one window
set showcmd
set background=dark

augroup numbertoggle    " Requires that number and relativenumber is set before
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END

" Functionality
set tabstop=2           " A literal tab character displays as 2 columns wide
set shiftwidth=2        " Indent/dedent (>>, <<, auto-indent) by 2 columns
set softtabstop=2       " Tab/Backspace in insert mode act as 2 spaces
set shiftround          " Round indents from > and < to a multiple of shiftwidth
set autoindent          " Indent Newlines
set copyindent          " Copy the exact indent structure of the previous line
set expandtab           " Spaces > tab

set hlsearch
set incsearch
set ignorecase          " Searches are case-insensitive by default
set smartcase           " ...unless the pattern contains uppercase letters

set hidden              " Allow switching buffers without saving; keeps unsaved buffers in background
