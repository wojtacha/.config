vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "Fastfile,Appfile,Matchfile,Pluginfile,Podfile,*.podspec" },
  callback = function() vim.o.filetype = "ruby" end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { ".pubignore" },
  callback = function() vim.o.filetype = "gitignore" end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { ".kts" },
  callback = function() vim.o.filetype = "kotlin" end,
})
