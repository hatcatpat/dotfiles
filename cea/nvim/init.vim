""""plugins
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

" themes
Plug 'rakr/vim-one'

" slime
Plug 'jpalardy/vim-slime'

call plug#end()

""""settings
" enable mouse
set mouse=a
" enable lines
set number
" tabsize
set shiftwidth=2
set autoindent

""""hotkeys
" clear search
nnoremap <silent> <space> :noh<CR>

" save
noremap <silent> <leader>w :w<CR>
inoremap <silent> <leader>w <C-o>:w<CR>

" quit
noremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <C-o>:q<CR>

" comment
noremap <silent> <leader>c :call NERDComment('n','Toggle')<CR>
inoremap <silent> <leader>c <C-o>:call NERDComment('x','Toggle')<CR>

""""plugin settings

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

" themes

if (has("termguicolors"))
    set termguicolors
endif

colorscheme one
set background=light
let g:one_allow_italics = 1
let g:airline_theme='one'

hi Normal guibg=NONE ctermbg=NONE

" slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
