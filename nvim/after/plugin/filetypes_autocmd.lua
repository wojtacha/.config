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
-- TODO dlaczego to nie dziala trzeba dodac noice dla messages i au 
--
local flutter = vim.api.nvim_create_augroup("FlutterExtension", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
  desc = "Register flutter extension",
  pattern = { ".dart" },
  callback = function()
    print "Flutter config running...  from after autocommand"
    require("flutter-tools").setup {}
    require("telescope").load_extension "flutter"
  end,
  group = flutter,
})
