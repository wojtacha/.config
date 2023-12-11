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
        config = function() require("mason").setup() end,
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

  { "RRethy/vim-illuminate", event = "VeryLazy" }, -- Vim plugin for automatically highlighting other uses of the word under the cursor
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
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   config = function() require("lspsaga").setup { lightbulb = { enable = false } } end,
  --   ft = { "go", "lua" },
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- optional
  --     "nvim-tree/nvim-web-devicons", -- optional
  --   },
  -- },
  { "mfussenegger/nvim-jdtls" },

  {
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
	json = { "fixjson" },
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
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      local lsp_zero = require "lsp-zero"
      lsp_zero.on_attach(function(client, bufnr) lsp_zero.default_keymaps { buffer = bufnr } end)
      require("flutter-tools").setup {
        lsp = {
          capabilities = lsp_zero.get_capabilities(),
        },
      }
    end,
  },
}
