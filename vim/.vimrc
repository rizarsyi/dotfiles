set nocompatible
set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand("~/.vim/bundle"))
set rtp+=~/.vim/bundle/vwilight/

" Bundles
NeoBundleFetch "Shougo/neobundle.vim"
NeoBundle "tpope/vim-fugitive"
NeoBundle "kien/rainbow_parentheses.vim"
NeoBundle "tpope/vim-commentary"
NeoBundle "sjl/gundo.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "ervandew/supertab"
NeoBundle "tpope/vim-markdown"
NeoBundle "kien/ctrlp.vim"
NeoBundle "pangloss/vim-javascript"
NeoBundle "othree/html5.vim"
NeoBundle "evanmiller/nginx-vim-syntax"
NeoBundle "scrooloose/syntastic"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "jnwhiteh/vim-golang"
NeoBundle "SirVer/ultisnips"
NeoBundle "mileszs/ack.vim"
NeoBundle "jiangmiao/auto-pairs"
NeoBundle "godlygeek/tabular"
NeoBundle "sjl/clam.vim"
NeoBundle "chrisbra/Recover.vim"
NeoBundle "tpope/vim-haml"
NeoBundle "bling/vim-airline"
NeoBundle "saltstack/salt-vim"
NeoBundle "elixir-lang/vim-elixir"
NeoBundle "majutsushi/tagbar"
NeoBundle "mhinz/vim-signify"
NeoBundle "mattn/emmet-vim"
NeoBundle "mitsuhiko/vim-jinja"
NeoBundle "mitsuhiko/vim-rst"
NeoBundle "honza/dockerfile.vim"
NeoBundle "vim-scripts/javacomplete"
NeoBundle "hsanson/vim-android"
NeoBundle 'garybernhardt/pycomplexity', {'rtp': 'pycomplexity.vim/'}
NeoBundle "derekwyatt/vim-scala"

filetype plugin indent on
syntax on

" Theming
if $TMUX != "" && $TERM != "screen-256color"
    set term=screen-256color
endif

set t_Co=256
color vwilight

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
set showbreak=↪

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

" set 2-spaces indentation for Ruby, Coffeescript, and YAML files
au FileType ruby setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType yaml setl softtabstop=2 shiftwidth=2 tabstop=2

" HTML and similar templates should not be limited to 80 columns
au FileType html,jinja setl textwidth=0

nnoremap <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '^dist$', '^build$', '^__pycache__$']
let NERDTreeHightlightCursorline=1

nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :TagbarToggle<CR>

" Folding
set foldmethod=indent
set nofoldenable

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

" Autopairs
let g:AutoPairsShortcutFastWrap = "<C-f>"
let g:AutoPairsMapCR = 0

" Highlight the overflow text
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=red ctermfg=white
au FileType python match OverLength /\%81v.\+/
au FileType php match OverLength /\%121v.\+/

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Toggles paste mode (http://is.gd/FxlJAH)
set pastetoggle=<F9>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:ttimeoutlen=50

" Emmet
let g:user_emmet_leader_key="<C-e>"

" Clam
let g:clam_winpos='botright'

" optional F6 mapping to fire :Complexity command
nnoremap <silent> <F6> :Complexity<CR>

" Last thing to do with
NeoBundleCheck
