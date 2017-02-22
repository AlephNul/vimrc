" A. DEFOURNE

" Global Options {{{
set nocompatible	" Vi compatibility	Must be set first

set tabstop=8		" Length of tabulations
set shiftwidth=8	" Length of < and > shifts
set shiftround		" Set indent with < and > to multiple of shifwidth

set relativenumber	" Display line numbers relative to cursor

set statusline=%f\ -\ %y
set statusline+=%=%l/%L\ --%p--
set laststatus=2	" Always display status line

syntax on
filetype plugin indent on
" }}}

execute pathogen#infect()

let mapleader = "&"

" Mappings {{{
" Edit and source vimrc file
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>	
nnoremap <LEADER>sv :source $MYVIMRC<CR>

" Scroll one line up and down
nnoremap - <C-Y>
nnoremap + <C-E>

" Exit insert mode
inoremap jk <ESC>
inoremap <ESC> <NOP>
" }}}

" Vim file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

