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


-----------------
--  which-key  --
-----------------

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    name = "Telescope",
    f = {
      f = "Files",
      g = "Live Grep",
      b = "Buffers",
      h = "Help Tags",
      t = "Telescope (builtin pickers)",
    },
  },
})
