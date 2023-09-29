local all_cmp_filetypes = { "lua", "dart", "swift", "ruby", "rust" }
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
        ft = { "lua", "dart", "swift", "ruby", "rust" },
        -- event = "VeryLazy",
      },

      -- Required
      { "hrsh7th/cmp-nvim-lsp", ft = all_cmp_filetypes }, -- Required
      { "hrsh7th/cmp-buffer", ft = all_cmp_filetypes }, -- Optional
      { "hrsh7th/cmp-path", ft = all_cmp_filetypes }, -- Optional
      { "saadparwaiz1/cmp_luasnip", ft = all_cmp_filetypes }, -- Optional
      { "hrsh7th/cmp-nvim-lua", ft = all_cmp_filetypes }, -- Optional
      -- Snippets
      { "L3MON4D3/LuaSnip", ft = all_cmp_filetypes }, -- Required
      { "rafamadriz/friendly-snippets", ft = all_cmp_filetypes }, -- Optional
    },
  },

  { "mhartington/formatter.nvim", cmd = "Format" },
  { "mfussenegger/nvim-lint" },
  { "ms-jpq/coq_nvim", branch = "coq", ft = { "go" } },
}
