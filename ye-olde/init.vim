set number
set mouse=a
set clipboard=unnamed
set completeopt-=preview

call plug#begin('~/.config/nvim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'sophacles/vim-processing'
Plug 'rakr/vim-one'
Plug 'ycm-core/YouCompleteMe'
Plug 'tikhomirov/vim-glsl'
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier'
call plug#end()

set termguicolors
"let ayucolor="mirage"
"let ayucolor="light"
"colorscheme ayu
colorscheme one
set background="dark"
let g:airline_theme='one'
hi Normal guibg=NONE ctermbg=NONE

set shiftwidth=2

"autocmd FileType javascript set shiftwidth=2 | nnoremap <silent> <C-b> :silent exec "!cp % ~/Documents/Processing/JS/p5js/public/sketch.js"<CR>

autocmd FileType python nnoremap <silent> <C-b> :!python main.py<CR>

"autocmd FileType glsl :ALEDisable | nnoremap <silent> <C-s> :call ReloadGLSLShader()<CR> | 
"function ReloadGLSLShader()
    ":w
    ":exec "!python ~/.local/share/scripts/send_osc.py --port 1234 --addr /reload"
"endfunction

let g:indentLine_char='│'

let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--semi false'

nnoremap <Space> :noh<CR>
nnoremap <C-b> :make<CR>

nnoremap <C-q> :q<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

nnoremap <S-u> :redo<CR>
nnoremap <leader>a =ip
nnoremap <leader>e :Explore<CR>
nnoremap <Up> gk
nnoremap <Down> gj
