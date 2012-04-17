" `vi` compability mode
set nocompatible

filetype off

" pathogen options
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
syntax on

filetype plugin indent on

" display options
set title
set visualbell
set textwidth=80
set number
set ruler
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,eol:¬
set encoding=utf-8
set wrap
set linebreak
set showcmd

" theme options
set t_Co=256
color twilight

" formatting options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set shiftround
set noeol
set backspace=indent,eol,start

" buffer options
set hidden
set autoread
set autowrite

" search options
set hlsearch
set incsearch
set ignorecase
set smartcase

set nospell

set wildmode=list:longest,list:full
set wildignore+=*.o,*.pyc,*.git

" backup options
set noswapfile
set nobackup
set nowritebackup

" highlight JSON as JavaScript
au BufRead,BufNewFile *.json set ft=javascript

" ensure Makefille always use tabs instead of spaces
au FileType make setl noexpandtab

" set 2-spaces indentation for Ruby and Coffeescript files
au FileType ruby setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2

nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>
