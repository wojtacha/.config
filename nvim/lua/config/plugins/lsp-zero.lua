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
      { "hrsh7th/nvim-cmp", ft = all_cmp_filetypes },
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
  { "ms-jpq/coq_nvim", branch = "coq", lazy = true },
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function() require("go").setup() end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },
  {
    "nvimdev/lspsaga.nvim",
    config = function() require("lspsaga").setup { lightbulb = { enable = false } } end,
    ft = { "go", "lua" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  { "mfussenegger/nvim-jdtls" },
}
