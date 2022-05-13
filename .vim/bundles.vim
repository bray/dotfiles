" ---------------------------------------------------------------------------
" vim-plug Plugins
" ---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')


if has("gui_running")
  Plug 'SirVer/ultisnips'
end

"Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-scripts/CmdlineComplete'
Plug 'mileszs/ack.vim'
"Plug 'AutoTag'
"Plug 'sjl/gundo.vim'
Plug 'nelstrom/vim-markdown-preview'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/greplace.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-abolish'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'jremmen/vim-ripgrep'

Plug 'mbbill/undotree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'phanviet/vim-monokai-pro'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'easymotion/vim-easymotion'

Plug 'romainl/vim-cool'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'


call plug#end()
