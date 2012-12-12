set nocompatible
filetype off
set rtp+=~/dotfiles/vim/bundle/vundle

call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'

if isdirectory('/usr/share/go/misc/vim/')
  set rtp+=/usr/share/go/misc/vim
endif

filetype plugin indent on
syntax enable

if filereadable('/home/jud/.google.vim')
  source /home/jud/.google.vim
  " Don't auto-wrap text
  set formatoptions-=t
else
  set expandtab
  set smartindent
  set tabstop=2
  set shiftwidth=2
  set autochdir
endif

set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase
set number
set showmatch

set textwidth=80
set colorcolumn=+1

" Search for ctags file up the directory tree
set tags=./tags;/

" Keep cursor off bottom of screen
set scrolloff=3

set backspace=indent,eol,start

" Make tab completion bash-like
set wildmode=longest,list,full
set wildmenu

"if exists("+autochdir")
"    set autochdir
"endif

" Turn off blinking cursor
set guicursor+=a:blinkon0

" Folding
set foldmethod=syntax
" Start with all folds open
set foldlevelstart=99

" Toggle NERDTree with Ctrl-E
map <silent> <C-E> :NERDTreeToggle<CR>

" Add space around comment delimiter
let NERDSpaceDelims = 1

" Setup ctrlp to ignore source control related directories
let g:ctrlp_custom_ignore = '\.git$\|review$'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|review$'

" e - Jump when <cr> is pressed, but only to windows in the current tab.
" t - jump when <c-t> is pressed, but only to windows in another tab.
let g:ctrlp_switch_buffer = 'et'

" Only show cursorline in current window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set list
set listchars=tab:▸\ ,extends:▹,precedes:◃
" Shortcut to toggle 'set list'
" nmap <leader>l :set list!<CR>
" Some alternate list chars
"set listchars=tab:▸\ ,eol:¬,trail:◦
