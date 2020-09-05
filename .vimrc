if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'zhaocai/GoldenView.Vim' "Auto resizes windows
Plug 'qpkorr/vim-bufkill' " Delete buffer without deleting window
" Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'w0rp/ale' " On the fly syntax checker/prettifier
Plug 'tpope/vim-sensible' " Lots of mini 'fixes' like searching before pressing enter
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets' " Goes with ultrasnip
Plug 'Raimondi/delimitMate' " closes brackets etc
Plug 'kien/ctrlp.vim' " Helm for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'andymass/vim-matchup' "Highight matching statement
Plug 'easymotion/vim-easymotion' "like vimfx
Plug 'dyng/ctrlsf.vim' "Search across multiple files
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'agude/vim-eldar'
:inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'ap/vim-buftabline' " buffer list at top
Plug 'davisdude/vim-love-docs' " love2d documentation
Plug 'luochen1990/rainbow' " Highlights brackets etc
Plug 'tbastos/vim-lua' " lua completion
Plug 'hecal3/vim-leader-guide'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " Markdown
Plug 'lervag/vimtex' " latex

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" Initialize plugin system
call plug#end()
"

"Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

"nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" If previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Rainbow Parentheses
let g:rainbow_active = 1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" AirLine settings
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


"My bindings
let mapleader="\<Space>"
nmap <leader>w/ :vsplit <CR>
nmap <leader>w_ :split <CR>
nmap <leader>wm :wincmd <Bar><CR>
nmap <leader>wd :q <CR>
nmap <leader>w= :vertical resize +5<CR>
nmap <leader>w-  :vertical resize -5<CR>
nmap <leader>wb :ToggleGoldenViewAutoResize<CR>:wincmd =<CR>
nmap <leader>ft :NERDTreeToggle <cr>
nmap <leader>0 :NERDTreeFocus <cr>
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>bN :new<CR>
nmap <leader>bd :BD<CR>
nmap <leader>bn :bnext<CR>
nnoremap <leader><tab> :b#<cr>
nmap <leader>bp :bprev<CR>
nmap <leader>fs :w<CR>
nmap <leader>fS :wa<CR>
nmap <leader>QQ :xa<CR>
nmap <leader>feR :PlugInstall<CR>
nmap <leader>wg :ToggleGoldenViewAutoResize<CR>
nmap <leader>rl :!love $PWD<CR>
nmap <leader>tn :set number! relativenumber!<CR>
nmap <leader>th :nohlsearch<CR>
nmap <leader>/r :CtrlSF 
nnoremap <Leader>bl :ls<CR>:b<Space>
" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk
"My settings
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>fb :CtrlPBuffer<CR>
set number relativenumber
set nu rnu
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set hidden
set autoread
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set clipboard=unnamed
 " set guioptions+=a
 " set guioptions -=m
 " set guioptions -=T
 " set guioptions -=r
 " set guioptions -=L
set guifont=Hack\ Bold\ 11

let g:dracula_colorterm=0
color dracula

" Personal Snippets
filetype plugin on
autocmd FileType lua inoremap ;if if  then<CR><CR>end<ESC>2kli
autocmd FileType lua inoremap ;eif if  then<CR><CR>else<CR><CR>end<ESC>4kli
autocmd FileType lua inoremap ;f function ()<CR><CR>end<ESC>2kWi
autocmd FileType markdown setlocal spell spelllang=en_gb
autocmd FileType markdown setlocal linebreak
autocmd FileType tex setlocal spell spelllang=en_gb
autocmd FileType tex setlocal linebreak


