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
require('telescope').load_extension('recent_files')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>m', '<cmd>lua require("telescope").extensions.recent_files.pick()<cr>')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tt', builtin.builtin, {})


------------------
--  bufferline  --
------------------

require('bufferline').setup {
  options = {
    mode = 'tabs'
  }
}

local opts = { noremap = true }

-- New tab
vim.keymap.set('n', '<A-t>', '<cmd>tabnew<cr>', opts)

-- Close tab
vim.keymap.set('n', '<A-w>', '<C-w>q', opts)

-- Move to previous/next
vim.keymap.set('n', 'H', 'gT', opts)
vim.keymap.set('n', 'L', 'gt', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<leader>H', '<cmd>tabmove -<cr>', opts)
vim.keymap.set('n', '<leader>L', '<cmd>tabmove +<cr>', opts)

-- Pick a tab by file letter (this maps <C-/>)
vim.keymap.set('n', '<C-_>', '<cmd>BufferLinePick<cr>', opts)


-----------------
--  which-key  --
-----------------

local wk = require('which-key')
wk.register({
  ['<leader>'] = {
    f = 'Find Files (Telescope)',
    m = 'MRU Files',
    t = {
      name = 'Telescope',
      g = 'Live Grep',
      b = 'Buffers',
      h = 'Help Tags',
      t = 'Telescope (builtin pickers)',
    },
  },
})


--------------------
--  Comment.nvim  --
--------------------

local ft = require('Comment.ft')
ft.set('text', '#%s')


------------------
--  Treesitter  --
------------------

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'ruby' },
  auto_install = true,
  highlight = {
    enable = true
  }
}
