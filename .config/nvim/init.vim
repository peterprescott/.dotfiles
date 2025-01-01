""" VIM CONFIG """
" Try `:help`, or even `:Tutor`.

" Use vim-plug for plugins
call plug#begin('~/.local/share/nvim/plugged')

" sensible initial settings
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" colorscheme
Plug 'morhetz/gruvbox'

Plug 'ap/vim-css-color' " css color previev

" ipython REPL
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

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

" window resizing
Plug 'simeji/winresizer'
Plug 'moll/vim-bbye'

" markdown
Plug 'preservim/vim-markdown'

" file explorer
Plug 'preservim/nerdtree'

" " code completion
" Plug 'github/copilot.vim'

" csv
Plug 'mechatroner/rainbow_csv'

call plug#end()

function! OpenNERDTree()
    if &columns > 120
        NERDTree | wincmd p
    endif
    wincmd p " move cursor to the previous window (main file)
endfunction

function! OpenTagbar()
    if &columns > 160
        Tagbar | wincmd p
    endif
    wincmd p " Move cursor to the previous window (main file)
endfunction

" Auto commands to trigger the functions
autocmd VimEnter * call OpenNERDTree()
autocmd VimEnter * call OpenTagbar()

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

set number " line numbering
" set statusline=%{wordcount().words}\ words
" set tw=72 " limit text-width 
set hidden " buffers
set colorcolumn=72
filetype plugin on
autocmd FileType html,css,javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set foldmethod=syntax
syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlD

" color scheme
set background=dark
colorscheme gruvbox
let g:airline_theme='minimalist'

" open .vimrc
nmap ; :
let mapleader = ","
nnoremap <leader>ev :edit $MYVIMRC<cr>
" reload
nnoremap <leader>rv :source $MYVIMRC<cr>
nmap <leader>q :Bdelete<cr>

" virtualenv
let g:python_host_prog = system('which python')

" code class structure
nmap <leader>c :TagbarToggle<CR>

" install plugins
nmap <leader>p :PlugInstall<CR>

" windows
let g:winresizer_start_key = '<leader>w'

" buffers
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#formatter = 'unique_tail_improved' " f/p/file-name.js
nmap <leader>bb :bn<cr>
nmap <leader>B :bp<cr>


" file explorer (nerdtree)
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

nnoremap <leader>f :call NERDTreeToggleAndRefresh()<cr>
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" markdown
let g:vim_markdown_fenced_languages = ['python', 'c', 'javascript']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" folding
let g:SimpylFold_docstring_preview = 1
nmap <space> za

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
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom}' }
let g:slime_dont_ask_default = 1

" ipython cell
let g:ipython_cell_tag = '```'
nmap <leader>ii :SlimeSend1 conda activate 38; ipython --matplotlib<cr>
nmap <leader>exit :SlimeSend1 exit<cr>
nmap <leader>ww :IPythonCellExecuteCell<cr> " execute cell
nmap <leader>wa :IPythonCellRun<cr> " run whole script
nmap <leader>dd :IPythonCellClear<cr> " clear iPython screen
nmap <leader>da :IPythonCellClose<cr> " close matplotlib figs


