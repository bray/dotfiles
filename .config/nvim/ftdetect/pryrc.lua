vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"pryrc", "*.pryrc"},
  command = "set filetype=ruby",
})
