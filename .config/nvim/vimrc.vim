" Get started with existing vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath



" ---------------------------------------------------------------------------
"
" Basics
"
" ---------------------------------------------------------------------------


let mapleader=","      " Change leader from \ to ,

" Reveal in Finder - opens finder to folder of the file that is currently open
command! Rif execute '!open %:p:h'

" Scroll up and down a little faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Restore the line and window positions when re-opening a buffer
" (instead of only the line position)
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Disable accidentally typing K, which I'll never use
nnoremap K ""
vnoremap K ""

" Better marks
nnoremap ' `
nnoremap ` '

" Disable folding
set nofoldenable
set foldminlines=99999

" Include - when doing keyword completion (C-n and C-p)
set iskeyword+=\-

" Copy the relative file path to the system clipboard
nmap ,cp :let @*=expand("%")<CR>

" Automatically center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz



" ---------------------------------------------------------------------------
" Search
" ---------------------------------------------------------------------------

set ignorecase
set smartcase
set incsearch
set hlsearch

" ,n instead of :nohl
nmap <silent> <leader>n :silent :nohlsearch<CR>

" No need to escape special regex chars in search
"nnoremap / /\v
"nnoremap ? ?\v



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

set splitright  " Put a new vertical split window on the right
set splitbelow  " Put a new horizontal split window below

nmap <leader>v :vs<CR>
nmap <leader>s :sp<CR>

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

let @c = '[m]MI#' " Comment out the current method
let @y = 'gccyypgcc'  " Comment out line and copy (using gcc from the tcomment_vim plugin)
let @u = 'yypVr-'      " Underline heading
let @h = 'f:xf ce:' " Convert old Ruby hash (:a => 'b') to new Ruby hash (a: 'b')
let @b = "r:f'xbh"    " Convert string into symbol
let @s = "r'ea'bh"  " Convert symbol into string

" Remove trailing whitespace
noremap <silent> <leader>rtw :%s/\s\+$//g<cr>``



" ---------------------------------------------------------------------------
" Backups and Persistence
" ---------------------------------------------------------------------------

set directory=~/.vim/swp//,.
set undofile  " Persist undo history



" ---------------------------------------------------------------------------
" Command-Line Mode
" ---------------------------------------------------------------------------

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-BS> <C-w>
cnoremap <M-d> <S-Right><C-w>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>



" ---------------------------------------------------------------------------
" Quickfix Mode
" ---------------------------------------------------------------------------

" Navigate up and down
nnoremap <silent><C-n> :cn<cr>
nnoremap <silent><C-p> :cp<cr>

" Close the Quickfix window
nnoremap <silent><leader>q :cclose<cr>





" ---------------------------------------------------------------------------
" Terminal UI Options
" ---------------------------------------------------------------------------

" Set cursor for Neovim
" Note: the blink intervals and some other settings here (e.g. vert width) are NOT configurable in any terminal, only GUIs :(
set guicursor+=i-ci:ver25-blinkwait250-blinkon400-blinkoff250

if has("termguicolors")
  set termguicolors
endif

" Set the style for the highlighted current line
highlight CursorLine term=bold cterm=bold guibg=Grey15
highlight QuickFixLine ctermbg=256 guibg=#334659
