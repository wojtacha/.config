return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { -- Optional
        "williamboman/mason.nvim",
        build = function() pcall(vim.cmd, "MasonUpdate") end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        config = function()
          local cmp = require "cmp"
          cmp.setup {
            mapping = {
              ["<C-j>"] = function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end,
              ["<C-k>"] = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end,
              ["<cr>"] = function(fallback)
                if cmp.visible() then
                  cmp.confirm { select = true }
                else
                  fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                end
              end,
              ["<C-l>"] = function(fallback)
                if cmp.visible() then
                  cmp.confirm()
                else
                  fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                end
              end,
            },
          }
        end,
      },
      { "mfussenegger/nvim-lint" },

      -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  },
  { "mhartington/formatter.nvim" },
}
