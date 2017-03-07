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

" Enclose visual region inside quotes, parens, etc.
vnoremap ar' <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ar" <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ar( <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ar{ <ESC>`>a}<ESC>`<i{<ESC>
vnoremap ar[ <ESC>`>a]<ESC>`<i[<ESC>

" Open last buffer in new window
nnoremap <a :execute "leftabove split" bufname("#") <CR>
nnoremap <b :execute "rightbelow split" bufname("#") <CR>
nnoremap <l :execute "leftabove vsplit" bufname("#") <CR>
nnoremap <r :execute "rightbelow vsplit" bufname("#") <CR>

" Pattern searches
nnoremap / /\v
nnoremap ? ?\v
nnoremap nh :noh<CR>

" Scroll one line up and down
nnoremap - <C-Y>
nnoremap + <C-E>

" Exit insert mode
inoremap jk <ESC>
inoremap <ESC> <NOP>
" }}}

" ======= Grep Operator ====== "
" {{{
nnoremap <LEADER>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <LEADER>g :<C-U>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
	let save = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[y`]"
	else
		return
	endif

	silent execute "grep! -R" shellescape(@@) "."
	copen

	let @@ = save
endfunction
" }}}

" ===== Vim file settings ==== "
" {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

