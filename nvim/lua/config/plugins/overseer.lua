return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      require("overseer").setup {
        default_template_prompt = "allow",
        log = {
          {
            type = "file",
            filename = "overseer.log",
            level = vim.log.levels.DEBUG, -- or TRACE for max verbosity
          },
        },
        templates = { "builtin", "user.run_script" },
      }
    end,
  },
}
