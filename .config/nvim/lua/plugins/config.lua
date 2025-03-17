-- Default options for mappings
local opts = { noremap = true }


--------------------------------------------------------------------------------
-- ripgrep (rg)
--------------------------------------------------------------------------------

-- Shortcut to :Rg
vim.keymap.set('n', '\\', ':Rg<SPACE>', opts)

-- Search for word under cursor
vim.keymap.set('n', 'K', ':Rg "\\b<C-R><C-W>\\b"<CR>', opts)



--------------------------------------------------------------------------------
-- vim-airline
--------------------------------------------------------------------------------

-- Performance improvements?
vim.g.airline_extensions = {}
vim.g.airline_highlighting_cache = 1

vim.g['airline#extensions#tmuxline#enabled'] = 0
vim.g['airline#extensions#tabline#enabled'] = 0

vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''

local temp_airline_symbols = vim.g.airline_symbols
temp_airline_symbols.branch = ''
temp_airline_symbols.readonly = ''
temp_airline_symbols.dirty = ''
-- temp_airline_symbols.colnr = ' ℅:'
-- temp_airline_symbols.linenr = ' :'
-- temp_airline_symbols.maxlinenr = '☰ '
vim.g.airline_symbols = temp_airline_symbols

vim.g['airline#extensions#default#layout'] = {
  { 'a', 'c' },
  { 'x', 'y', 'z', 'warning', 'error' }
}

-- Display the GitHub codeowner(s) of the file
vim.g.airline_section_y = '%{codeowners#whoBufname()}'

-- Display prettier current line and column
vim.g.airline_section_z = 'Line: %l / %L (%p%%) | Col: %c'

vim.g.airline_theme = 'kolor' -- purple and a little pink



--------------------------------------------------------------------------------
-- telescope
--------------------------------------------------------------------------------

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close
      },
    },
  },

  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden" },
      follow = false,
    },
  },

  extensions = {
    recent_files = {
      -- Only show files in the current working directory
      only_cwd = true
    }
  }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('recent_files')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>m', '<cmd>lua require("telescope").extensions.recent_files.pick()<cr>')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tt', builtin.builtin, {})



--------------------------------------------------------------------------------
-- bufferline
--------------------------------------------------------------------------------

require('bufferline').setup {
  options = {
    mode = 'tabs'
  }
}


-- New tab
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>', opts)

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



--------------------------------------------------------------------------------
-- which-key
--------------------------------------------------------------------------------

local wk = require('which-key')
wk.add({
  {'<leader>m',  desc = 'MRU Files'},

  {'<leader>t',  name = '+Telescope'},
  {'<leader>tg', desc = 'Live Grep'},
  {'<leader>tb', desc = 'Buffers'},
  {'<leader>th', desc = 'Help Tags'},
  {'<leader>tt', desc = 'Telescope (builtin pickers)'},

  {'<leader>h',  desc = 'Hop'},
})



--------------------------------------------------------------------------------
-- Comment.nvim
--------------------------------------------------------------------------------

local ft = require('Comment.ft')
ft.set('text', '#%s')



--------------------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'ruby' },
  auto_install = true,
  highlight = {
    enable = true
  }
}










--------------------------------------------------------------------------------
-- Hop
--------------------------------------------------------------------------------

require('hop').setup()

vim.keymap.set('n', '<space>', '<cmd>HopChar2MW<cr>')
vim.keymap.set('n', '<leader>hw', '<cmd>HopWord<cr>')
vim.keymap.set('n', '<leader>hp', '<cmd>HopPattern<cr>')



--------------------------------------------------------------------------------
-- mini.ai
--------------------------------------------------------------------------------

require('mini.ai').setup()



--------------------------------------------------------------------------------
-- mini.surround
--------------------------------------------------------------------------------

require('mini.surround').setup({
  search_method = 'cover_or_nearest',
  mappings = {
    update_n_lines = '',
    replace = 'gr',
    add = 'gsa',
    delete = 'gsd',
  }
})



--------------------------------------------------------------------------------
-- mini.pick
--------------------------------------------------------------------------------

-- Center picker window
local win_config = function()
  height = math.floor(0.618 * vim.o.lines)
  width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup({
  mappings = {
    delete_word = '<M-bs>',
  },

  window = {
    config = win_config,
  },
})

vim.keymap.set('n', '<leader>f', function()
  MiniPick.builtin.files()
end, {desc = 'Find Files (MiniPick)'})

vim.api.nvim_set_hl(0, 'MiniPickMatchRanges', { fg = '#82B1FF' })



--------------------------------------------------------------------------------
-- yazi
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>d',
  '<cmd>Yazi toggle<cr>',
  {desc = 'Resume the last yazi session'}
)

vim.keymap.set({'n', 'v'}, '<leader>-',
  '<cmd>Yazi<cr>',
  {desc = 'Open yazi at the current file'}
)




--------------------------------------------------------------------------------
-- vim-rhubarb
--------------------------------------------------------------------------------

-- :GBrowse somehow broke recently and defining this command is now needed
vim.api.nvim_create_user_command(
  'Browse',
  'silent execute "!open" shellescape(<q-args>,1)',
  { nargs = 1 }
)



--------------------------------------------------------------------------------
-- indent_blankline
--------------------------------------------------------------------------------

-- Only enable for YAML files
local hooks = require('ibl.hooks')
hooks.register(hooks.type.ACTIVE, function(bufnr)
  return vim.tbl_contains(
    { 'yaml' },
    vim.api.nvim_get_option_value('filetype', { buf = bufnr })
  )
end)



--------------------------------------------------------------------------------
-- Undotree
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })

vim.g.undotree_WindowLayout = 2
vim.g.undotree_TreeNodeShape = '•'
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SplitWidth = 30



--------------------------------------------------------------------------------
-- gutentags
--------------------------------------------------------------------------------

-- This can significantly shrink the size of the tags file and speed up rewriting it on save
vim.g.gutentags_ctags_exclude = { 'node_modules', '*.css', '*.less', '*.scss', '*.js', '*.json' }



--------------------------------------------------------------------------------
-- yanky
--------------------------------------------------------------------------------
require('yanky').setup({
  highlight = {
    on_yank = false,
    timer = 200,
  },
})

require("telescope").load_extension("yank_history")

vim.keymap.set({'n','x'}, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({'n','x'}, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set({'n','x'}, 'gp', '<Plug>(YankyGPutAfter)')
vim.keymap.set({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
vim.keymap.set('n', '[p', '<Plug>(YankyCycleForward)')
vim.keymap.set('n', ']p', '<Plug>(YankyCycleBackward)')



--------------------------------------------------------------------------------
-- nvim-spectre
--------------------------------------------------------------------------------
require('spectre').setup({
  live_update = true,
  is_block_ui_break = true,
})



--------------------------------------------------------------------------------
-- LuaSnip
--------------------------------------------------------------------------------

require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
