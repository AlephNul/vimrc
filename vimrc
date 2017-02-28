" A. DEFOURNE

" ====== Global Options ====== "
" {{{
set nocompatible	" Vi compatibility; must be set first

execute pathogen#infect()

filetype plugin indent on
syntax on

set tabstop=8		" Length of tabulations
set shiftwidth=8	" Length of < and > shifts
set shiftround		" Set indent with < and > to multiple of shifwidth

set relativenumber	" Display line numbers relative to cursor

set hlsearch		" Hightlight search results
set incsearch		" Hightlight while typing pattern

set statusline=%f\ -\ %y
set statusline+=%=%l/%L\ ~\ %P\ ~
set laststatus=2	" Always display status line
" }}}

" ========= Mappings ========= "
" {{{
let mapleader = "&"

" Edit and source vimrc file
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>	
nnoremap <LEADER>sv :source $MYVIMRC<CR>

" Open last buffer in new window
nnoremap <a :execute "leftabove split" bufname("#") "<CR>"
nnoremap <b :execute "rightbelow split" bufname("#") "<CR>"
nnoremap <l :execute "leftabove vsplit" bufname("#") "<CR>"
nnoremap <r :execute "rightbelow vsplit" bufname("#") "<CR>"

" Disable highlighting
nnoremap nh :noh<CR>

" Automatically make 'very magic' searches
nnoremap / /\v

" Scroll one line up and down
nnoremap - <C-Y>
nnoremap + <C-E>

" Exit insert mode
inoremap jk <ESC>
inoremap <ESC> <NOP>
" }}}

" ===== Vim file settings ==== "
" {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

