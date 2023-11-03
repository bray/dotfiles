" Get started with existing vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath





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
