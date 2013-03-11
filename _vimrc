" `vi` compability mode
set nocompatible

if $TMUX != "" && $TERM != "screen-256color"
    set term=screen-256color
endif

" pathogen options
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set rtp+=$HOME/.powerline/powerline/bindings/vim

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

" highlight Jinja2 template as Jinja
au BufRead,BufNewFile *.jinja2 set ft=jinja

" ensure Makefile always use tabs instead of spaces
au FileType make setl noexpandtab

" ensure Go always use tabs instead of spaces
au FileType go setl noexpandtab

" set 2-spaces indentation for Ruby and Coffeescript files
au FileType ruby setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2

" HTML and similar templates should not be limited to 80 columns
au FileType html,jinja setl textwidth=0

nnoremap <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :TagbarToggle<CR>

" Folding
set foldmethod=indent
set nofoldenable

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

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabClosePreviewOnPopupClose = 1
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

" Autopairs
let g:AutoPairsShortcutFastWrap = "<C-f>"
let g:AutoPairsMapCR = 0

" Highlight the overflow text
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=red ctermfg=white
au FileType python match OverLength /\%81v.\+/
au FileType php match OverLength /\%121v.\+/

let g:gitgutter_enabled = 0
nnoremap <F6> :call ToggleGitGutter()<CR>

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
