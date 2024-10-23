-- Copy full file path to clipboard
vim.api.nvim_create_user_command('CopyFullPath', 'let @+ = expand("%:p")', {})

-- Copy relative file path to clipboard
vim.api.nvim_create_user_command('CopyRelativePath', 'let @+ = expand("%")', {})

-- Restore the line and window positions when re-opening a buffer
-- (instead of only the line position)
vim.cmd([[
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
]])

-- Alias :G blame to :Gb
vim.api.nvim_create_user_command('Gb', 'G blame', {})
