" ---------------------------------------------------------------------------
" vim-plug Plugins
" ---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')


if has("gui_running")
  Plug 'SirVer/ultisnips'
end

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/CmdlineComplete'
Plug 'kchmck/vim-coffee-script'

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
