-- Set the style for the current line
vim.api.nvim_set_hl(0, 'CursorLine', {
  bg = 'Grey15',
  bold = true
})

-- Set the style for the current line in QuickFix mode
vim.api.nvim_set_hl(0, 'QuickFixLine', {
  bg = '#334659',
  ctermbg = 256
})

