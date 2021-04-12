""""PLUGINS
call plug#begin('~/.config/nvim/plugged')

" for linting
Plug 'dense-analysis/ale'
" for status bar
Plug 'vim-airline/vim-airline'
" auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
" commenting
Plug 'preservim/nerdcommenter'

call plug#end()

""""SETTINGS
" enables mouse
set mouse=a
" uses correct clipboard
set clipboard=unnamed
" line numbers
set number
" tab size
set shiftwidth=2
" auto-indenting
set autoindent

""""HOTKEYS
" clear selection
nnoremap <silent> <space> :noh<CR>
" save
noremap <silent> <leader>s :w<CR>
inoremap <silent> <leader>s <C-o>:w<CR>
" quit
noremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <C-o>:q<CR>
" comment
noremap <silent> <leader>c :call NERDComment('n','Toggle')<CR>
inoremap <silent> <leader>c <C-o>:call NERDComment('x','Toggle')<CR>

""""SPECIFIC

" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" ale
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \}

let g:ale_linters = {
      \   'c': ['cc'],
      \}

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
