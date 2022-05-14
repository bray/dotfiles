" ---------------------------------------------------------------------------
" vim-plug Plugins
" ---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')


if has("gui_running")
  Plug 'SirVer/ultisnips'
end

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround' " Delete/change/add parentheses/quotes, etc.
Plug 'kana/vim-textobj-user' " Required by vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock' " Custom text object for selecting Ruby blocks
Plug 'vim-scripts/CmdlineComplete' " Complete command-line (: / etc.) via Ctrl-P or Ctrl-N
Plug 'kchmck/vim-coffee-script' " Syntax, etc. for CoffeeScript

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Awesome fuzzy search
Plug 'junegunn/fzf.vim' " Bundle of fzf scripts
Plug 'pbogut/fzf-mru.vim' " MRU for FZF
Plug 'jremmen/vim-ripgrep' " RipGrep in vim
Plug 'mbbill/undotree' " Undo history visualizer
Plug 'vim-airline/vim-airline' " Status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'drewtempelmeyer/palenight.vim' " Color theme
Plug 'easymotion/vim-easymotion' " Super-quick vim motions
Plug 'romainl/vim-cool' " Disables search highlighting when done searching
Plug 'airblade/vim-gitgutter' " Show git diff markers next to line numbers
Plug 'tpope/vim-endwise' " Auto-add end after def, if, etc.
Plug 'tomtom/tcomment_vim' " Easily (un-)comment lines
Plug 'kana/vim-arpeggio' " Better jk -> <Esc>


call plug#end()
