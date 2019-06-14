set nocompatible
filetype off

set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
call vundle#end()

if isdirectory('/usr/share/go/misc/vim/')
  set rtp+=/usr/share/go/misc/vim
endif

filetype plugin indent on
syntax enable

set expandtab
set smartindent
set tabstop=2
set shiftwidth=2

if filereadable($HOME.'/.vimrc_local')
  source $HOME/.vimrc_local
endif

colorscheme desert

let mapleader = ","

set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase
set showmatch

set textwidth=80
set colorcolumn=+1

" Don't continue comment when hitting o.
set formatoptions-=o

" Search for ctags file up the directory tree
set tags=./tags;/

" Keep cursor off bottom of screen
set scrolloff=3

set backspace=indent,eol,start

" Make tab completion bash-like
set wildmode=longest,list,full
set wildmenu

" Turn off blinking cursor
set guicursor+=a:blinkon0

" Folding
set foldmethod=syntax
" Start with all folds open
set foldlevelstart=99

" Don't insert 2 spaces after a '.' when joining or reformatting a paragraph.
set nojoinspaces

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.
set autoread

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

" Don't highlight trailing whitespace in go, because it highlights the indent on
" new lines which drives me crazy.
let g:go_highlight_trailing_whitespace_error = 0

" Whitelist of filetypes to enable ycm for.
let g:ycm_filetype_whitelist = {
    \ 'c' : 1,
    \ 'cpp' : 1,
    \ 'py' : 1
    \}
" Autoclose the preview window that YouCompleteMe generates after a completion.
let g:ycm_autoclose_preview_window_after_completion = 1

let g:VCSCommandDiff = 'vertical'

