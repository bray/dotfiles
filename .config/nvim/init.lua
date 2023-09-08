-- Source the old init.vim (.vimrc) file
-- This will be removed once all of vimrc.vim is
-- migrated to lua
local vimrc = vim.fn.stdpath('config') .. '/vimrc.vim'
vim.cmd.source(vimrc)

require 'options'
require 'plugins'
require 'mappings'
