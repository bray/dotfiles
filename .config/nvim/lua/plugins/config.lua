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
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
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



-- This is needed to show rendered Markdown except where the cursor is, where it shows the source
vim.opt.conceallevel = 2

require('render-markdown').setup({
  heading = {
    enabled = true,

    render_modes = false,
    sign = true,
    icons = { '', '', '', '', '', '' },
    position = 'overlay',
    signs = { '󰫎 ' },

    width = 'block',
    min_width = 80,
    left_margin = 0,
    left_pad = 0,
    right_pad = 0,

    border = false,
    border_virtual = false,
    border_prefix = false,
    above = '▄',
    below = '▀',

    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },

    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
    custom = {},
  },
  link = {
    enabled = true,
    footnote = {
      superscript = true,
      prefix = '',
      suffix = '',
    },
    image = '󰥶 ',
    email = '󰀓 ',
    hyperlink = '󰌹 ',
    highlight = 'RenderMarkdownLink',
    wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
    custom = {
      web = { pattern = '^http', icon = '󰖟 ' },
      youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
      github = { pattern = 'github%.com', icon = '󰊤 ' },
      neovim = { pattern = 'neovim%.io', icon = ' ' },
      stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
      discord = { pattern = 'discord%.com', icon = '󰙯 ' },
      reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
    },
  },
})



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
-- fzf-lua
--------------------------------------------------------------------------------

require('fzf-lua').setup({
  -- Profile (theme)
  'telescope',

  winopts = {
    -- Disable backdrop darkening
    backdrop = 100,

    height   = 0.75,
    row      = 0.5,

    -- TODO: keep looking at options
    preview = {
      -- wrap = true,
    },
  },
})


vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<cr>', {desc = 'Find Files (FzfLua)'})
vim.keymap.set('n', '<leader>z', '<cmd>FzfLua<cr>', {desc = 'Builtin Commands (FzfLua)'})



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



--------------------------------------------------------------------------------
-- Copilot
--------------------------------------------------------------------------------

vim.g.copilot_node_command = "~/.local/share/mise/installs/node/20.10.0/bin/node"
