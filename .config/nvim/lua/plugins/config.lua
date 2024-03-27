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
-- vim-arpeggio
--------------------------------------------------------------------------------

vim.fn['arpeggio#load']()
vim.fn['arpeggio#map']('i', '', false, 'jk', '<Esc>')
vim.fn['arpeggio#map']('i', '', false, 'JK', '<Esc>')
vim.fn['arpeggio#map']('c', '', false, 'jk', '')
vim.fn['arpeggio#map']('c', '', false, 'JK', '')



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

-- Remove the unused 'y' section
-- (file encoding by default)
vim.g['airline#extensions#default#layout'] = {
  { 'a', 'b', 'c' },
  { 'x', 'z', 'warning', 'error' }
}

-- Display current branch
vim.g.airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'

-- Display prettier current line and column
vim.g.airline_section_z = 'Line: %l / %L (%p%%) | Col: %c'

vim.g.airline_theme = 'cobalt2'



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
wk.register({
  ['<leader>'] = {
    m = 'MRU Files',
    t = {
      name = 'Telescope',
      g = 'Live Grep',
      b = 'Buffers',
      h = 'Help Tags',
      t = 'Telescope (builtin pickers)',
    },
    h = 'Hop',
  },
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
-- Oil
--------------------------------------------------------------------------------

require('oil').setup {
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-s>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["g."] = "actions.toggle_hidden",
  },

  view_options = { show_hidden = true },
}

-- Enable previewer automatically
vim.api.nvim_create_autocmd("User", {
  pattern = "OilEnter",
  callback = vim.schedule_wrap(function(args)
    local oil = require("oil")
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.select({ preview = true })
    end
  end),
})


vim.keymap.set('n', '<leader>d', '<CMD>Oil<CR>')




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
  highlight_duration = 1000,
  mappings = {
    update_n_lines = '',
    search_method = 'cover_or_nearest',
    replace = 'gsr',
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
