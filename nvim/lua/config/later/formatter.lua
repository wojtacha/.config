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

local function swift_format()
  return {
    exe = "swiftformat",
    args = {
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = false,
  }
end

local util = require "formatter.util"

local filetype_config = {
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
  swift = { swift_format },
  ruby = {
    require("formatter.filetypes.ruby").rubocop,
  },
  css = { require("formatter.filetypes.css").prettier },
  typescriptreact = { prettier_format },
  javascript = { prettier_format },
  javascriptreact = { prettier_format },
  ["javascript.jsx"] = { prettier_format },
  typescript = { prettier_format },
  ["typescript.tsx"] = { prettier_format },
  -- ["*"] = {
  --   require("formatter.filetypes.any").remove_trailing_whitespace,
  -- },
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.INFO,
  filetype = filetype_config,
}

local function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent + 1)
    elseif type(v) == "boolean" then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end

local M = {}
M.format = function()
  local ft = vim.bo.ft
  if filetype_config[ft] == nil then
    -- local lsp_clients = vim.lsp.get_active_clients()
    -- for _, value in pairs(lsp_clients) do
    -- print("lsp name: " .. value.name)
    -- print(tprint(value.server_capabilities, 1))
    -- end
    vim.lsp.buf.format()
  else
    vim.cmd.Format()
  end
end

return M
