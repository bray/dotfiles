local opts = { noremap = true }

-- Use Cmd-s to save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("v", "<C-s>", "<C-c>:w<CR>")
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>")

-- Delete the previous word (MacVim already did this)
vim.keymap.set('i', '<M-BS>', '<C-w>', opts)

-- Toggle paste mode
vim.keymap.set('n', '<leader>p', '<cmd>set invpaste<cr>', opts)

-- Use Cmd-c to copy to system clipboard
vim.keymap.set('v', '<M-c>', '"+y', opts)

-- Close the current window
vim.keymap.set('n', '<C-q>', '<C-w>q', opts)
