-------------------
--  vim-airline  --
-------------------

vim.g['airline#extensions#tmuxline#enabled'] = 0

vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
vim.g.airline_symbols.branch = ''
vim.g.airline_symbols.colnr = ' ℅:'
vim.g.airline_symbols.readonly = ''
vim.g.airline_symbols.linenr = ' :'
vim.g.airline_symbols.maxlinenr = '☰ '
vim.g.airline_symbols.dirty='⚡'

vim.g.airline_theme = 'cobalt2'


-----------------
--  telescope  --
-----------------

require('telescope').setup()
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.builtin, {})
-- TODO: add whatever else is useful


-----------------
--  which-key  --
-----------------

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope",
      f = "Files",
      g = "Live Grep",
      b = "Buffers",
      h = "Help Tags",
      t = "Telescope (builtin pickers)",
    },
  },
})


--------------------
--  Comment.nvim  --
--------------------

local ft = require('Comment.ft')
ft.set('text', '#%s')
