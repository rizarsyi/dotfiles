" `vi` compability mode
set nocompatible

" pathogen options
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

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

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.pyc,*.git,*.hg,*.svn,*.DS_STORE,*.sw?,*.py[co],*.orig
set completeopt=longest,menuone,preview

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

nnoremap <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :TagbarToggle<CR>

" Folding
set foldmethod=indent
set nofoldenable

" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'
