" file: .vimrc
" Author: Antoine DEFOURNÉ
" Email: antoine.defourne at inria.fr


" Use the defaults
source $VIMRUNTIME/defaults.vim

" Check the defaults with :e $VIMRUTIME/defaults.vim
" In particular, these are enabled by default:
" Syntax hightlighting
" Filetype detection

" Redefine map(local)leader
let mapleader = "è"
let maplocalleader = "_"

" Quick edit/source vimrc file
nnoremap <Leader>e :tabedit $MYVIMRC<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>

""" OPTIONS {{{1

" Display both number line and relative number lines
set number relativenumber

" Always display (default) statusline
set laststatus=2

" Highlight matches but not while typing
set hlsearch noincsearch

" Windows' minimal size
set winheight=15 winwidth=40
set winminheight=3 winminwidth=12

"" TABS {{{2
" Indentation and Tab options
" Smarttab lets Vim use shiftwidth for <Tab>s at the
" begining of a line, and tabstop anywhere else
" Expandtab is set so that spaces are used instead of
" actual tabs
set smarttab expandtab
set tabstop=2 shiftwidth=4

"" FOLDS {{{2
" Use Vim markers for folds
" This should be enough for most cases since only
" Vim uses these markers
set foldmethod=marker

" Don't display folds by default
set foldcolumn=0

" Close all folds the cursor moves outside of
set foldlevel=0 foldclose=all

" }}}2

""" MERLIN CONFIG {{{1

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" }}}

" THAT'S ALL FOLKS
