""" VIM CONFIG """
" Try `:help`, or even `:Tutor`.

" Use vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')

" sensible initial settings
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-surround'

" toggle comments with `gcc`
Plug 'tpope/vim-commentary'

" colorscheme
Plug 'morhetz/gruvbox'

" ipython REPL
Plug 'jpalardy/vim-slime'

" ale syntax checking
Plug 'dense-analysis/ale'

" sudo
Plug 'lambdalisue/suda.vim'

" python folding
Plug 'tmhedberg/SimpylFold'

" code structure
Plug 'preservim/tagbar'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

" window resizing
Plug 'simeji/winresizer'

" markdown
Plug 'preservim/vim-markdown'

" file explorer
Plug 'preservim/nerdtree'

call plug#end()

set number " line numbering
set statusline=%{wordcount().words}\ words
set tw=72 " limit text-width 
set nohidden " buffers
set colorcolumn=72

" color scheme
set background=dark
colorscheme gruvbox

" open .vimrc
let mapleader = ","
nnoremap <leader>v :vsplit $MYVIMRC<cr>
" reload
nnoremap <leader>r :source $MYVIMRC<cr>

" code class structure
nmap <leader>c :TagbarToggle<CR>

" install plugins
nmap <leader>p :PlugInstall<CR>

" windows
let g:winresizer_start_key = '<leader>w'

" file explorer
nnoremap <leader>f :NERDTreeToggle<cr>

" markdown
let g:vim_markdown_fenced_languages = ['python', 'c', 'javascript']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1


" suda config
let g:suda_smart_edit = 1

" ALE is an *asynchronous linting engine*
" (make sure that pylint etc. are installed in your python environment)
let g:ale_virtualtext_cursor = 'current'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_set_highlights=1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save =1
let g:ale_lsp_suggestions = 1

" slime gives a python REPL with <CTRL-C>
" always use tmux
let g:slime_target = 'tmux'
" fix paste issues in ipython
let g:slime_python_ipython = 1
" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom}' }
let g:slime_dont_ask_default = 1

