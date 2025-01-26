-- Current line
vim.api.nvim_set_hl(0, 'CursorLine', {
  bg = 'Grey15',
  bold = true
})

-- QuickFix mode
vim.api.nvim_set_hl(0, 'QuickFixLine', {
  bg = '#334659',
  ctermbg = 256
})

-- Lighter visual mode
vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#4e576a'
})
