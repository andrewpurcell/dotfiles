set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

" TO INSTALL ON A NEW MACHINE
" - Install Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" - Open vim and run :PluginInstall
call vundle#begin()
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
" Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'bling/vim-airline'
Plugin 'kshenoy/vim-signature'
Plugin 'jamessan/vim-gnupg'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'Yggdroot/indentLine'
call vundle#end()

syntax on
filetype plugin indent on

" Allow project specific settings in .vimlocal
set exrc
set secure

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

nmap <c-p> :FZF<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Use command! to prevent errors on reload
command! Q q
command! WQ wq
command! W w
command! Wq wq

let mapleader=" "
nmap <C-f> :CtrlPBuffer<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

command! Reload source ~/.vimrc

let g:netrw_liststyle=3

let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_display_regime="parentdir"
let g:buffergator_show_full_directory_path = 0
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" View the entire list of buffers open
nmap <leader>b :BuffergatorOpen<cr>

nmap <leader>p :echo expand('%:p')<cr>
" Highlight whitespace at the end of a line
match ErrorMsg /\s\+\%#\@<!$/

au InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
au InsertLeave * match ErrorMsg /\s\+$/

" Removes trailing spaces
function! TrimWhiteSpace()
      %s/\s\+$//e
endfunction
nmap <Leader>ww :call TrimWhiteSpace()<cr>

let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '(node_modules|build)$',
\}

" Indentation related
nmap == V=
nmap > V>
nmap < V<

command CompileDot !dot -Tpng -O %
command OpenPng !open %.png

nmap <leader>g :CompileDot<CR>:OpenPng<CR><CR>

" mixpanel-related commands
command! RV :execute "vsplit " . expand('%:r:h') . "/index.jade"
nmap gw :execute "Ggrep " . expand('<cword>')<cr>
" open quickfix window after grepping
autocmd QuickFixCmdPost *grep* cwindow
