return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      swift = { { "swiftformat", "swift_format" } },
      ruby = { "rubocop" },
      css = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      ["javascript.jsx"] = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      ["typescript.tsx"] = { { "prettierd", "prettier" } },
      sh = { "shellcheck", "shfmt" },
      zsh = { "prettier" },
      ["_"] = { "trim_whitespace" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
  },
  -- init = function()
  --   -- If you want the formatexpr, here is the place to set it
  --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
