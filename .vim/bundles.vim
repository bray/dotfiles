" ---------------------------------------------------------------------------
" Vundle Plugins
" ---------------------------------------------------------------------------

filetype off  " Must be off before Vundle has run

set rtp+=~/.dotfiles/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
let $GIT_SSL_NO_VERIFY = 'true'

Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on



"  ---------------------------------------------------------------------------
"  Plugin Config
"  ---------------------------------------------------------------------------

" Enable % to work for def/end, if/else/end, etc.
source /usr/share/vim/vim72/macros/matchit.vim

" CommandT
let g:CommandTMaxFiles = 50000 " Scan for more files if within a larger project (default is 10000)

" Fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_ultisnips"]
let g:UltiSnipsEditSplit="vertical"
