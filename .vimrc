" ---------------------------------------------------------------------------
" Basics
" ---------------------------------------------------------------------------

syntax on
filetype plugin indent on
set nocompatible              " be iMproved, required

" Fix vim (and imp) incompatibility with Python 3 (and UltiSnips)
if has('python3') && !has('patch-8.1.201')
  silent! python3 1
endif

set rtp+=/usr/local/opt/fzf

set number             " Show line numbers
set fillchars+=vert:\  " Remove the \| in vertical splits
set history=1000       " Remember 1000 lines of history
set visualbell t_vb=   " Disable audio error bell
set title              " Show the filepath (terminal)
set gcr=n:blinkon0     " No blinking cursor in Normal mode
set showcmd            " Display incomplete commands
let mapleader=","      " Change leader from \ to ,
set wildmenu           " Better tab-completion in command mode
set wildmode=list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set autoread           " Autoload outside changes

" Get out of insert mode much more easily
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>
vnoremap ii <Esc>
vnoremap II <Esc>

" Scroll up and down a little faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

set linebreak          " Don't split lines in the middle of words

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Restore the line and window positions when re-opening a buffer
" (instead of only the line position)
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Disable accidentally typing K, which I'll never use
nnoremap K ""
vnoremap K ""

" Better marks
nnoremap ' `
nnoremap ` '

" Disable folding
set nofoldenable
set foldminlines=99999


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
set listchars=eol:$,tab:>-,trail:-,nbsp:%  " Show more hidden chars when 'list' is set



" ---------------------------------------------------------------------------
" Splits
" ---------------------------------------------------------------------------

set splitright  " Put a new vertical split window on the right
set splitbelow  " Put a new horizontal split window below

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

let @c = '[m]MI#'    " Comment out the current method
let @y = 'yypki#j'   " Comment out line and copy
let @h = 'f:xf ce:'  " Convert old Ruby hash (:a => 'b') to new Ruby hash (a: 'b')
let @u = 'YpVr-'     " Underline heading

" Remove trailing whitespace
noremap <silent> <leader>rtw :%s/\s\+$//g<cr>``



" ---------------------------------------------------------------------------
" Backups and Persistence
" ---------------------------------------------------------------------------

set directory=~/.vim/swp//,.
set undofile  " Persist undo history
set undodir=~/.vim/undo



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

map <leader>j :cn<cr>
"map <leader>m :cn<cr>
map <leader>k :cp<cr>



" ---------------------------------------------------------------------------
" Plugin Config
" ---------------------------------------------------------------------------

" Matchit
" -------

" Enable % to work for def/end, if/else/end, etc.
source /usr/share/vim/vim80/macros/matchit.vim


" Fugitive
" --------

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" NERDTree
" --------

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>


" UltiSnips
" ---------

set viminfo='100,<50,s10,h,!
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_ultisnips"]
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsEditSplit="vertical"


" AutoTag
" -------

let g:autotagVerbosityLevel=40 " ERROR instead of the default WARNING


" Undotree
" --------

nnoremap <F5> :UndotreeToggle<cr>

" Set global undo directory to avoid undo files everywhere
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 2
endif


" FZF
" ---

" Shortcut to :FZF
map <leader>f :FZF<cr>


" FZF.vim
" ---

" Override vim's C-xC-l line completion so it uses FZF
imap <C-x><C-l> <plug>(fzf-complete-line)

" Complete (dictionary) word
imap <C-x><C-k> <plug>(fzf-complete-word)


" FZF-MRU
" -------

map <leader>m :FZFMru<cr>


" Ack / ag
" --------

" Shortcut to :Ag
nnoremap \ :Ag<SPACE>

" Search for word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>



" ---------------------------------------------------------------------------
" GUI Options
" ---------------------------------------------------------------------------

if has("gui_running")
  source ~/.vim/bundles.vim

  set guifont=Monaco:h13
  set guioptions-=T      " Remove toolbar
  set macmeta            " Set Alt as the Meta key (e.g. for cmdmode movement)
else
  set term=ansi
end

colorscheme railscasts_bray
set cursorline         " Highlight the current line
