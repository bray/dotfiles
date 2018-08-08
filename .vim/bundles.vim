" ---------------------------------------------------------------------------
" Vundle Plugins
" ---------------------------------------------------------------------------

filetype off  " Must be off before Vundle has run
"set nocompatible              " be iMproved, required

set rtp+=~/.dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

let $GIT_SSL_NO_VERIFY = 'true'

"Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'vim-scripts/CmdlineComplete'
Bundle 'mileszs/ack.vim'
Bundle 'AutoTag'
Bundle 'sjl/gundo.vim'
"Bundle 'bbommarito/vim-slim'
Bundle 'slim-template/vim-slim.git'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/greplace.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-abolish'
Bundle 'saltstack/salt-vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'junegunn/fzf.vim'
Bundle 'pbogut/fzf-mru.vim'
Bundle 'brookhong/ag.vim'

filetype plugin indent on " required

" All of your Plugins must be added before the following line
call vundle#end()            " required


" ---------------------------------------------------------------------------
" Plugin Config
" ---------------------------------------------------------------------------

" Matchit - Enable % to work for def/end, if/else/end, etc.
source /usr/share/vim/vim80/macros/matchit.vim

" CtrlP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_custom_ignore = 'bundle'
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>

" Fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" UltiSnips
set viminfo='100,<50,s10,h,!
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_ultisnips"]
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsEditSplit="vertical"

" AutoTag
let g:autotagVerbosityLevel=40 " ERROR instead of the default WARNING

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_bottom=1
