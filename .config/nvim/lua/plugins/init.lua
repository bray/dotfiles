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
  {
    'drewtempelmeyer/palenight.vim',                 -- Color theme
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
  { 'lewis6991/gitsigns.nvim', opts = {} },          -- Git diff markers in the sign column and other integration
  {
    'folke/which-key.nvim',                          -- Show popup of keybindings when typing
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },
  { 'numToStr/Comment.nvim', opts = {} },            -- gc to comment/uncomment lines/blocks
  'jeffkreeftmeijer/vim-numbertoggle',               -- Tiny plugin for better line numbers
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- Find, Filter, Preview, Pick
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',      -- Enable fzf in Telescope
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'jremmen/vim-ripgrep',                           -- ripgrep in vim
    config = function()
      vim.g.rg_highlight = true
    end,
  },
  {
    'akinsho/bufferline.nvim',                       -- Prettier tabs
    version = "v4.1.0",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
})


require('plugins/config')
