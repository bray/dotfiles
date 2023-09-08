local opts = { noremap = true }

-- Delete the previous word (MacVim already did this)
vim.keymap.set('i', '<M-BS>', '<C-w>', opts)

-- Toggle paste mode
vim.keymap.set('n', '<leader>p', '<cmd>set invpaste<cr>', opts)

-- Use Cmd-c to copy to system clipboard
vim.keymap.set('v', '<M-c>', '"+y', opts)
