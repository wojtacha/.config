require('lint').linters_by_ft = {
  -- yaml = {'actionlint', 'ansible_lint'},
  lua = {'luacheck'},
  ruby = {'rubocop'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
