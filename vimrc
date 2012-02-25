source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype plugin indent on
syntax on

set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase

set clipboard=unnamed

" Settings for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set backspace=indent,eol,start

" Make tab completion bash-like
set wildmode=longest,list,full
set wildmenu

if exists("+autochdir")
    set autochdir
endif

" Turn off blinking cursor
set guicursor+=a:blinkon0

" Automatically open syntastic error window when errors are detected
let g:syntastic_auto_loc_list=1
" Check cpp header files
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=gnu++0x'
let g:syntastic_javascript_checker='jshint'

" Folding
set foldmethod=syntax
" Start with all folds open
set foldlevelstart=99

" Highlight line greater than 79 characters for c files
" :au BufWinEnter *.c,*.cpp,*.h,*.py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

" Recognize cuda files
autocmd BufNewFile,BufRead *.cu setfiletype cuda

" Enable spell check and line breaks for tex files
autocmd FileType tex,plaintex setlocal spell showbreak=+++\

if exists('+colorcolumn')
    autocmd FileType python setlocal colorcolumn=80
endif

let b:verilog_indent_modules = 1

" Make sure filetype always gets set to tex instead of plaintex
let g:tex_flavor = "latex"

" Toggle NERDTree with Ctrl-E
map <silent> <C-E> :NERDTreeToggle<CR>

"set list
"set listchars=tab:▸\ ,extends:▹,precedes:◃
" Shortcut to toggle 'set list'
" nmap <leader>l :set list!<CR>
" Some alternate list chars
"set listchars=tab:▸\ ,eol:¬,trail:◦
