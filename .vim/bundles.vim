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
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'vim-scripts/CmdlineComplete'
Bundle 'mileszs/ack.vim'
Bundle 'AutoTag'
"Bundle 'sjl/gundo.vim'
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
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-commentary'

filetype plugin indent on " required

" All of your Plugins must be added before the following line
call vundle#end()            " required
