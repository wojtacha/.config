local function prettier_format()
  return {
    exe = "prettier",
    args = {
      "--config-precedence",
      "prefer-file",
      "--print-width",
      180,
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.INFO,
  filetype = {
    lua = {
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then return nil end
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    typescriptreact = { prettier_format },
    javascript = { prettier_format },
    javascriptreact = { prettier_format },
    ["javascript.jsx"] = { prettier_format },
    typescript = { prettier_format },
    ["typescript.tsx"] = { prettier_format },
    -- ["*"] = {
    --   require("formatter.filetypes.any").remove_trailing_whitespace,
    -- },
  },
}
