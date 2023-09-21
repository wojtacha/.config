vim.api.nvim_create_autocmd("BufEnter", {
  -- pattern = { "*.Jenkinsfile,Jenkinsfile.*,Jenkinsfile" },
  pattern = { "Fastfile,Appfile,Matchfile,Pluginfile,Podfile,*.podspec" },
  callback = function() vim.o.filetype = "ruby" end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { ".pubignore" },
  callback = function() vim.o.filetype = "gitignore" end,
})
