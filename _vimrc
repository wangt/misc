execute pathogen#infect()

syntax enable

" solarized dark color theme
set background=dark
colorscheme solarized

" molokai color theme 
let g:molokai_original = 1

" disable cursor blur
set gcr=a:block-blinkon0

" disable scroll bar
set guioptions-=l 
set guioptions-=L 
set guioptions-=r 
set guioptions-=R

" set menu bar and tool bar invisiable
set guioptions-=m 
set guioptions-=T

" full screen mode support
" F11  
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" full screen by default
au GUIEnter * simalt ~x

set encoding=utf-8
language messages en_US.utf-8

" Show status bar
set laststatus=2

" show cursor
set ruler

set number

" highlight current line and column
set cursorline 
set cursorcolumn

" highlight search result
set hlsearch

set nowrap

syntax enable
syntax on


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:20'
map <c-b> <Esc>:CtrlPBuffer<CR>

syntax on
filetype plugin indent on

"set guifont=Lucida_Console:h8:cDEFAULT
set guifont=Consolas:h11:cDEFAULT


" NERD_tree
map nf <Esc>:NERDTreeFind<CR>
map nt <Esc>:NERDTreeToggle<CR>
let g:NERDTreeWinSize=80

