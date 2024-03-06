if vim.g.vscode then
  print "VSCODE KURWA ON"
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
  vim.cmd [[source $HOME/.config/nvim/vscode/easymotion-config.vim]]
else
  require "config"
  require("lazy").setup("config.plugins", {
    change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = false, -- get a notification when changes are found
    },
    ui = {
      wrap = true, -- wrap the lines in the ui
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "rounded",
      title = "Lazy is crazy", ---@type string only works when border is not "none"
    },
  })

  require "config.later"
end
