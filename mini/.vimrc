call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
call plug#end()

"
" settings
"
syntax enable
set nocompatible
set mouse=a
set hlsearch
set ruler
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set autoindent
set linebreak

" colors
set background=dark
set t_Co=256
set termguicolors

"
" keybinds
"
nnoremap Q <Nop>
nnoremap q: <Nop>

nnoremap <F1> <Nop>
inoremap <F1> <Nop>

nnoremap <silent> <space> :noh<CR>

nnoremap <leader>w :w<CR>
inoremap <silent> <leader>w <C-o>:w<CR>

nnoremap <leader>q :q<CR>
inoremap <leader>q <C-o>:q<CR>

nnoremap <leader><tab> <C-x><C-o>
inoremap <leader><tab> <C-x><C-o>

"
" ale
"
let g:ale_completion_enabled=1
set omnifunc=ale#completion#OmniFunc

let g:ale_completion_autoimport=0

let g:ale_fixers={
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 'c': ['astyle'],
			\ 'sh': ['shfmt'],
			\}
let g:ale_fix_on_save=1

let g:ale_linters={
			\ 'c': ['gcc'],
			\ 'sh': ['shellcheck'],
			\}

let g:c_syntax_for_h=1
