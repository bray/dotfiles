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
  'edkolev/tmuxline.vim',                            -- Needed only to update tmux statusline; run :Tmuxline airline, then :TmuxlineSnapshot
  'jeffkreeftmeijer/vim-numbertoggle',               -- Tiny plugin for better line numbers
  'smartpde/telescope-recent-files',                 -- MRU files via Telescope
  'tpope/vim-fugitive',                              -- Various :Git commands
  'tpope/vim-rhubarb',                               -- Enables :GBrowse to open files/lines on Github
  'vim-airline/vim-airline',                         -- Statusline config
  'vim-airline/vim-airline-themes',                  -- Statusline themes
  { 'lewis6991/gitsigns.nvim', opts = {} },          -- Git diff markers in the sign column and other integration
  { 'numToStr/Comment.nvim', opts = {} },            -- gc to comment/uncomment lines/blocks
  'phaazon/hop.nvim',                                -- Replacement for EasyMotion
  { 'echasnovski/mini.nvim', version = false },      -- Collection of "mini" plugins (none enabled by default)
  'github/copilot.vim',                              -- AI: the future is NOW
  'mbbill/undotree',                                 -- Navigate the undo tree
  'tpope/vim-rails',                                 -- Rails helpers
  'ludovicchabant/vim-gutentags',                    -- Automatically update ctags
  'gbprod/yanky.nvim',                               -- Yank history
  'nvim-pack/nvim-spectre',                          -- Global search & replace


  { -- Color theme
    'wilmanbarrios/palenight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'palenight'
    end,
  },

  { -- Show popup of keybindings when typing
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },


  { -- Find, Filter, Preview, Pick
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  { -- Enable fzf in Telescope
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  { -- TEMP? It's currently much faster than Telescope
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
    },
  },

  { -- ripgrep in vim
    'jremmen/vim-ripgrep',
    config = function()
      vim.g.rg_highlight = true
    end,
  },

  { -- Prettier tabs
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  { -- Better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  { -- Highlight ranges of lines
    'winston0410/range-highlight.nvim',
    opts = {},
    dependencies = {
      'winston0410/cmd-parser.nvim',
    },
  },

  { -- Show indent lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    -- only until master is fixed
    commit = '65e20ab94a26d0e14acac5049b8641336819dfc7',
    opts = {},
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },

  { -- Show CODEOWNERS in the statusline
    'mrded/vim-github-codeowners',
    build = 'npm install',
  },

  { -- Use lazygit in Neovim
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lz", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
  },

  { -- Use Yazi (File tree / manipulation) in Neovim
    'mikavilpas/yazi.nvim',
    event = "VeryLazy",
    dependencies = { "folke/snacks.nvim", lazy = true },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },

})


require('plugins/config')
