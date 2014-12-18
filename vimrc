execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

set nocompatible
set number
set ruler
set autoread

set ignorecase
set hlsearch
set incsearch

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

set expandtab
set smarttab
set shiftwidth=2 tabstop=2 softtabstop=2

set backspace=indent,eol,start

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Use command! to prevent errors on reload
command! Q q
command! WQ wq
command! W w
command! Wq wq

command! Number set number!
command! Indent set ai! si!

let mapleader=" "

nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>qq :bdelete!<CR>

nmap <Leader>p :CtrlP
nmap <Leader>r !./%

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

command! Reload source ~/.vimrc

let g:netrw_liststyle=3

let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>b :BuffergatorOpen<cr>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>