set nocompatible
filetype off
set rtp+=~/dotfiles/vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'git://repo.or.cz/vcscommand'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
call vundle#end()

if isdirectory('/usr/share/go/misc/vim/')
  set rtp+=/usr/share/go/misc/vim
endif

filetype plugin indent on
syntax enable

if filereadable($HOME.'/.vimrc_local')
  source $HOME/.vimrc_local
else
  set expandtab
  set smartindent
  set tabstop=2
  set shiftwidth=2
  set autochdir
endif

colorscheme desert

let mapleader = ","

set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase
set number
set showmatch

set textwidth=80
set colorcolumn=+1

" Set default window size.
set lines=100 columns=86

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

" Don't insert 2 spaces after a '.' when joining or reformatting a paragraph.
set nojoinspaces

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

" Disable annoying warning from easytags about updatetime.
let g:easytags_updatetime_warn = 0

set list
set listchars=tab:▸\ ,extends:▹,precedes:◃

" Whitelist of filetypes to enable ycm for.
let g:ycm_filetype_whitelist = {
    \ 'c' : 1,
    \ 'cpp' : 1,
    \ 'py' : 1
    \}
" Autoclose the preview window that YouCompleteMe generates after a completion.
let g:ycm_autoclose_preview_window_after_completion = 1

let g:VCSCommandDiff = 'vertical'
