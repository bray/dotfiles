" ---------------------------------------------------------------------------
" Basics
" ---------------------------------------------------------------------------

syntax on
filetype plugin indent on

set number
set history=1000
set title              " Show the filepath (terminal)
set gcr=n:blinkon0     " No blinking cursor in Normal mode
set showcmd            " Display incomplete commands
let mapleader = ","    " Change leader from \ to , (e.g. for Command-T)
set wildmenu           " Better tab-completion in command mode
set wildmode=list,full
set scrolloff=3        " Give 3 lines of context when scrolling up or down
nnoremap <C-e> 3<C-e>  " Scroll down a little faster
nnoremap <C-y> 3<C-y>  " Scroll up a little faster
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>



" ---------------------------------------------------------------------------
" Search
" ---------------------------------------------------------------------------

set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <silent> <leader>n :silent :nohlsearch<CR> " ,n instead of :nohl

" No need to escape special regex chars in search
nnoremap / /\v
nnoremap ? ?\v



" ---------------------------------------------------------------------------
" Tabs & Spaces
" ---------------------------------------------------------------------------

set expandtab      " Expand tab character to spaces
set softtabstop=2  " Indent by 2 spaces when pressing <TAB>
set shiftwidth=2   " Indent by 2 spaces when using >>, <<, == etc.
set autoindent     " Keep indentation from previous line



" ---------------------------------------------------------------------------
" Splits
" ---------------------------------------------------------------------------

set splitright         " Put a new vertical split window on the right
set splitbelow         " Put a new horizontal split window below

" Use Ctrl-[kjhl] to select the active split
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>



" ---------------------------------------------------------------------------
" Sessions
" ---------------------------------------------------------------------------

" Remove options, which stores all 'options and mappings'
" (which has the side effect of keeping old mappings that have been deleted,
" e.g. from plugins that have been removed)
set sessionoptions-=options



" ---------------------------------------------------------------------------
" Macros
" ---------------------------------------------------------------------------

let @c = '[m]MI#'  " Comment out the current method
let @y = 'yypki#j'   " Comment out line and copy

" Remove trailing whitespace
noremap <silent> <leader>rtw :%s/\s\+$//g<cr>``



" ---------------------------------------------------------------------------
" Backups (.swp files)
" ---------------------------------------------------------------------------

set directory=~/.vim/swp//,.



" ---------------------------------------------------------------------------
" Set extra options when running in GUI mode
" ---------------------------------------------------------------------------

if has("gui_running")
  colorscheme railscasts_bray
  set guifont=Monaco:h13
  runtime bundles.vim
end
