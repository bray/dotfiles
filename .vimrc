" ---------------------------------------------------------------------------
" Basics
" ---------------------------------------------------------------------------

syntax on
filetype plugin indent on
set nocompatible              " be iMproved, required

" Fix vim (and imp) incompatibility with Python 3 (and UltiSnips)
"if has('python3') && !has('patch-8.1.201')
"  silent! python3 1
"endif
"" Python Setting {
"  set pythondll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
"  set pythonhome=/usr/local/Frameworks/Python.framework/Versions/3.7
"  set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
"  set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.7
"" }

if has('python')
endif


set rtp+=/usr/local/opt/fzf

set number             " Show line numbers
set fillchars+=vert:\  " Remove the \| in vertical splits
set history=1000       " Remember 1000 lines of history
set visualbell t_vb=   " Disable audio error bell
set title              " Show the filepath (terminal)
set gcr=n:blinkon0     " No blinking cursor in Normal mode
set showcmd            " Display incomplete commands
set wildmenu           " Better tab-completion in command mode
set wildmode=list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set autoread           " Autoload outside changes
set linebreak          " Don't split lines in the middle of words
set cursorline         " Highlight the current line
set regexpengine=1     " Use old regexp engine (faster?)
set noshowcmd          " Don't show command in bottom line (faster?)
set noshowmode         " Don't show -- INSERT -- in bottom line (vim-airline shows this in status line)
set pastetoggle=<C-t>  " CTRL-p toggles paste mode
set ttimeoutlen=0      " Make escape go back to normal mode instantly


let mapleader=","      " Change leader from \ to ,

" Reveal in Finder - opens finder to folder of the file that is currently open
command! Rif execute '!open %:p:h'

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

" Include - when doing keyword completion (C-n and C-p)
set iskeyword+=\-

" Copy the relative file path to the clipboard
nmap ,cp :let @*=expand("%")<CR>


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
let @y = 'yypki#j'  " Comment out line and copy
let @u = 'YpVr-'      " Underline heading
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

" Enable Vundle
source ~/.vim/bundles.vim


" Matchit
" -------

" Enable % to work for def/end, if/else/end, etc.
if filereadable('/usr/share/vim/vim80/macros/matchit.vim')
  source /usr/share/vim/vim80/macros/matchit.vim
endif


" Fugitive
" --------

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" NERDTree
" --------

"map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>d :NERDTreeToggle<CR>
map <leader>M :NERDTreeMirror<CR>
map <leader>D :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1


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
map <leader>f :Files<cr>


" FZF.vim
" -------

" Override vim's C-xC-l line completion so it uses FZF
imap <C-x><C-l> <plug>(fzf-complete-line)

" Complete (dictionary) word
imap <C-x><C-k> <plug>(fzf-complete-word)


" FZF-MRU
" -------

map <leader>m :FZFMru<cr>


" The Silver Searcher (ag)
" ------------------------

" Shortcut to :Ag
nnoremap \ :Ag<SPACE>

" Search for word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>


" vim-airline
" -----------

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'simple' " default is 'dark'
let g:airline_theme = 'dark' " default is 'dark'



" vim-easymotion
" --------------

"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need more keystroke, but on average, it may be more comfortable.
nmap <Space> <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" TODO these conflict w/ navigating search results
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" is this necessary?
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)



" ---------------------------------------------------------------------------
" GUI Options
" ---------------------------------------------------------------------------


if has("gui_running")
  set guifont=Monaco\ for\ Powerline:h13  " Set font
  set guioptions-=T                       " Remove toolbar
  set macmeta                             " Set Alt as the Meta key (e.g. for cmdmode movement)
end


colorscheme palenight
let g:palenight_terminal_italics=1

if (has("termguicolors"))
  set termguicolors
endif

" Set the style for the highlighted current line
hi CursorLine term=bold cterm=bold guibg=Grey15
