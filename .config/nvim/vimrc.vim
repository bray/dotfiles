" Get started with existing vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath











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
