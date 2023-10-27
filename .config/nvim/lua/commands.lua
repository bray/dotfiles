-- Copy full file path to clipboard
vim.api.nvim_create_user_command('CopyFullPath', 'let @+ = expand("%:p")', {})
