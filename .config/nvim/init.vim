""" VIM CONFIG """
" Vim is the ultimate text editor.
" Try `:help`, or even `:Tutor`.

" Use vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')

" sensible initial settings
Plug 'tpope/vim-sensible'

" toggle comments with `gcc`
Plug 'tpope/vim-commentary'

" colorscheme
Plug 'morhetz/gruvbox'

" spotlight paragraph with `:Limelight`
Plug 'junegunn/limelight.vim'

" eliminate distractions
Plug 'junegunn/goyo.vim'

" autoformat
Plug 'Chiel92/vim-autoformat'

" file system explorer
Plug 'preservim/nerdtree'

" simple autocompletion
Plug 'maxboisvert/vim-simple-complete'

call plug#end()

set number " line numbering
set statusline+=%{wordcount().words}\ words
set tw=80 " limit text-width 
set hidden " buffers

" color scheme
set background=dark
colorscheme gruvbox

" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" file system explorer
nnoremap <leader>f :NERDTreeFocus<CR>
