local opts = { noremap = true }
local opts_silent = { noremap = true, silent = true }

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

-- Better marks
vim.keymap.set('n', "'", '`', opts)
vim.keymap.set('n', '`', "'", opts)

-- Scroll up and down a little faster
vim.keymap.set('n', '<C-e>', '3<C-e>', opts)
vim.keymap.set('n', '<C-y>', '3<C-y>', opts)
vim.keymap.set('n', '<C-e>', '3<C-e>', opts)
vim.keymap.set('n', '<C-y>', '3<C-y>', opts)

-- Automatically center search results
vim.keymap.set('n', 'n',  'nzz',  opts_silent)
vim.keymap.set('n', 'N',  'Nzz',  opts_silent)
vim.keymap.set('n', '*',  '*zz',  opts_silent)
vim.keymap.set('n', '#',  '#zz',  opts_silent)
vim.keymap.set('n', 'g*', 'g*zz', opts_silent)

-- ,n instead of :nohl
vim.keymap.set('n', '<leader>n', '<cmd>nohlsearch<CR>', opts)
