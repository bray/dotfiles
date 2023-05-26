-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  { -- Color theme
    'drewtempelmeyer/palenight.vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'palenight'
    end,
  },

  'kana/vim-arpeggio',                               -- Better jk -> <Esc>
  'vim-airline/vim-airline',                         -- Statusline config
  'vim-airline/vim-airline-themes',                  -- Statusline themes
  'edkolev/tmuxline.vim',                            -- Needed only to update tmux statusline
  'tpope/vim-fugitive',                              -- Various :Git commands
  'tpope/vim-rhubarb',                               -- Enables :GBrowse to open files/lines on Github
  { 'lewis6991/gitsigns.nvim', opts = {} },          -- Git diff markers in the sign column and other integration
  'smartpde/telescope-recent-files',                 -- MRU files via Telescope

  { -- Show popup of keybindings when typing
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },

  { 'numToStr/Comment.nvim', opts = {} },            -- gc to comment/uncomment lines/blocks
  'jeffkreeftmeijer/vim-numbertoggle',               -- Tiny plugin for better line numbers

  { -- Find, Filter, Preview, Pick
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { -- Enable fzf in Telescope
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  { -- ripgrep in vim
    'jremmen/vim-ripgrep',
    config = function()
      vim.g.rg_highlight = true
    end,
  },

  { -- Prettier tabs
    'akinsho/bufferline.nvim',
    version = 'v4.1.0',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  { -- Better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
})


require('plugins/config')
