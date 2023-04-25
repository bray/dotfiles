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
  'drewtempelmeyer/palenight.vim',    -- Color theme
  'kana/vim-arpeggio',                -- Better jk -> <Esc>
  'vim-airline/vim-airline',          -- Statusline config
  'vim-airline/vim-airline-themes',   -- Statusline themes
  'tpope/vim-fugitive',               -- Various :Git commands
})


require('plugins/config')
