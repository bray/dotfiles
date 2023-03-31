" Get started with existing vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath



" ---------------------------------------------------------------------------
"
" Basics
"
" ---------------------------------------------------------------------------

syntax on
filetype plugin indent on

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

if has('python3')
endif


set rtp+=/usr/local/opt/fzf

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
set hidden             " Allow switching buffers without first writing changes


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

" Close the Quickfix window
nnoremap <silent> <leader>q :cclose<CR>



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

nnoremap <leader>j :cn<cr>
"map <leader>m :cn<cr>
nnoremap <leader>k :cp<cr>



" ---------------------------------------------------------------------------
" Plugin Config
" ---------------------------------------------------------------------------

" Enable vim-plug
source ~/.vim/bundles.vim


" Matchit
" -------

" Built-in plugin: enable % to work for def/end, if/else/end, etc.
runtime macros/matchit.vim


" NERDTree
" --------

"map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>d :NERDTreeToggle<CR>
map <leader>M :NERDTreeMirror<CR>
map <leader>D :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1


" UltiSnips
" ---------

set viminfo='100,<50,s10,h,!
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_ultisnips"]
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsEditSplit="vertical"


" Undotree
" --------

nnoremap <F5> :UndotreeToggle<cr>

if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 2
endif


" FZF
" ---

" Shortcut to :FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>H :History:<cr>
nnoremap <leader>b :Buffers<cr>


" FZF.vim
" -------

" Override the default Files command
" to use preview (with my options)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', $FZF_CTRL_T_PREVIEW_OPTS]}, <bang>0)

" Override vim's C-xC-l line completion so it uses FZF
imap <C-x><C-l> <plug>(fzf-complete-line)

" Complete (dictionary) word
imap <C-x><C-k> <plug>(fzf-complete-word)


" FZF-MRU
" -------


" Set window position & size, add preview window
command! -bang -nargs=? FZFMru call fzf_mru#actions#mru(<q-args>, {'window': {'width': 0.9, 'height': 0.6}, 'options': ['--preview', $FZF_CTRL_T_PREVIEW_OPTS]}, <bang>0)

" Mapping
nnoremap <leader>m :FZFMru<cr>


" ripgrep (rg)
" ------------

" Shortcut to :Rg
nnoremap \ :Rg<SPACE>

" Search for word under cursor
nnoremap K :Rg "\\b<C-R><C-W>\\b"<CR>


" vim-airline
" -----------

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'simple' " default is 'dark'
let g:airline_theme = 'dark' " default is 'dark'
let g:airline_section_y = ''


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
" This is needed instead of easymotion-overwin-f2 on Macs (except local) because overwin doesn't work there ...
"nmap <Space> <Plug>(easymotion-s2)

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
" GUI Options
" ---------------------------------------------------------------------------

if has("gui_running")
  set guifont=Monaco\ for\ Powerline:h15                        " Set font
  set guioptions-=T                                             " Remove toolbar
  set macmeta                                                   " Set Alt as the Meta key (e.g. for cmdmode movement)
  set guicursor+=i-ci:ver25-blinkwait250-blinkon400-blinkoff250 " Insert mode defaults except start blinking quicker
end

colorscheme palenight
let g:palenight_terminal_italics=1

if (has("termguicolors"))
  set termguicolors
endif

" Set the style for the highlighted current line
highlight CursorLine term=bold cterm=bold guibg=Grey15
highlight QuickFixLine ctermbg=256 guibg=#334659



" ---------------------------------------------------------------------------
" Terminal Options
" ---------------------------------------------------------------------------

if !has("gui_running")
  let &t_SI = "\e[5 q"  " Set the cursor to a blinking bar when in Insert mode (like it already does in GUI)
  let &t_SR = "\e[3 q"  " Set the cursor to a blinking underscore when in Replace mode (like it already does in GUI)
  let &t_EI = "\e[2 q"  " Set the cursor to a block otherwise (like it already does in GUI)
end
