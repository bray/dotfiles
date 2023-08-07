" Get started with existing vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath



" ---------------------------------------------------------------------------
"
" Basics
"
" ---------------------------------------------------------------------------

let g:python3_host_prog = '~/.asdf/shims/python3'

set number             " Show line numbers
set fillchars+=vert:\  " Remove the \| in vertical splits
set history=2000       " Remember 2000 lines of history
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
set pastetoggle=<C-t>  " CTRL-t toggles paste mode
set ttimeoutlen=0      " Make escape go back to normal mode instantly
set shortmess-=S       " Show # of matches (in bottom right corner) when searching
set shortmess+=I       " Don't show startup screen when starting vim
set hidden             " Allow switching buffers without first writing changes
set breakindent        " Every wrapped line will continue visually indented
set complete=.,w,b,u   " Don't search tags when doing i_Ctrl-n and i_Ctrl-p


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

" Delete the previous word (MacVim already did this)
imap <M-BS> <C-w>

" Toggle paste mode
nnoremap <leader>p <cmd>set invpaste<cr>

" Use Cmd-c to copy to system clipboard
vnoremap <M-c> "+y



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
" Plugin Config
" ---------------------------------------------------------------------------

lua << EOF
  -- Load Lazy.nvim plugins
  require 'plugins'
EOF


" Matchit
" -------

" Built-in plugin: enable % to work for def/end, if/else/end, etc.
runtime macros/matchit.vim


" UltiSnips
" ---------

set viminfo='100,<50,s10,h,!
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_ultisnips"]
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsEditSplit="vertical"


" ripgrep (rg)
" ------------

" Shortcut to :Rg
nnoremap \ :Rg<SPACE>

" Search for word under cursor
nnoremap K :Rg "\\b<C-R><C-W>\\b"<CR>


" vim-gitgutter
" -------------

set updatetime=100
set signcolumn=yes

" This fixes ,h from taking a few seconds
" Because gutter has default mappings like ,hs etc., so when you type <leader>h
" vim waits to see if you'll continue with the rest of another mapping, if
" not, uses <leader>h
" So I'll need to remap those if I want to use them
" :verbose map <leader>h
let g:gitgutter_map_keys = 0

" Navigate hunks (better than the default of ]c and [c)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Operate on current hunk
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)


" vim-arpeggio
" ------------

call arpeggio#load()
Arpeggioimap jk <Esc>
Arpeggiocmap jk 
Arpeggioimap JK <Esc>
Arpeggiocmap JK 



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
