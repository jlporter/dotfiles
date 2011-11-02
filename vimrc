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

"Folding - use spacebar to open and close folds, fold method may not be
"correct here
"set foldmethod=indent
"nnoremap <space> za
"vnoremap <space> zf

" Highlight line greater than 79 characters for c files
" :au BufWinEnter *.c,*.cpp,*.h,*.py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

" Recognize cuda files
autocmd BufNewFile,BufRead *.cu setfiletype cuda

" Recognize llvm files
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable spell check and line breaks for tex files
autocmd FileType tex,plaintex set spell formatoptions=1 lbr

let b:verilog_indent_modules = 1

" Make sure filetype always gets set to tex instead of plaintex
let g:tex_flavor = "latex"

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

"set list
"set listchars=tab:▸\ ,extends:▹,precedes:◃
" Shortcut to toggle 'set list'
" nmap <leader>l :set list!<CR>
" Some alternate list chars
"set listchars=tab:▸\ ,eol:¬,trail:◦
