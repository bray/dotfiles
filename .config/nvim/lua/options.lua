vim.opt.breakindent = true                          -- Every wrapped line will continue visually indented
vim.opt.complete:remove('t')                        -- Don't search tags when doing i_Ctrl-n and i_Ctrl-p
vim.opt.cursorline = true                           -- Highlight the current line
vim.opt.fillchars:append('eob: ')                   -- Remove the annoying ~ at the end of a buffer
vim.opt.history = 2000                              -- Remember 2000 lines of history
vim.opt.number = true                               -- Show line numbers
vim.opt.shortmess:append('I')                       -- Don't show startup screen when starting vim
vim.opt.showmode = false                            -- Don't show -- INSERT -- in bottom line (vim-airline shows this in status line)
vim.opt.signcolumn = 'yes'                          -- Always show the sign column (e.g. for gitsigns)
vim.opt.ttimeoutlen = 0                             -- Make escape go back to normal mode instantly

vim.g.python3_host_prog = '~/.asdf/shims/python3'   -- Change python3 path to use asdf shim
vim.g.loaded_ruby_provider = 0                      -- No need for Ruby provider
