vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"Tiltfile*", "*starlark"},
  command = "set filetype=python",
})
