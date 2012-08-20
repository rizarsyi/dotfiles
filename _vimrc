" `vi` compability mode
set nocompatible

" pathogen options
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

let mapleader = ","

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
set laststatus=2

" theme options
set t_Co=256
color vwilight

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

" backup options
set noswapfile
set nobackup
set nowritebackup

" highlight JSON as JavaScript
au BufRead,BufNewFile *.json set ft=javascript

" ensure Makefile always use tabs instead of spaces
au FileType make setl noexpandtab

" set 2-spaces indentation for Ruby and Coffeescript files
au FileType ruby setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2

nnoremap <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :TagbarToggle<CR>

" Folding
set foldmethod=indent
set nofoldenable

" Powerline
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Zen coding - ctrl+e
let g:user_zen_expandabbr_key = '<c-e>'

" Use ack instead of grep
set grepprg=ack-grep\ -a

" trailing whitespace
autocmd BufWritePre * :silent! %s/\s\+$//e
autocmd BufWritePre * :silent! %s#\($\n\)\+\%$##

" omnicompletion
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Supertab
let g:SuperTabDefaultCompletionType = "context"
