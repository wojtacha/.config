return {
  { "tpope/vim-fugitive", cmd = "Git" },
  {
	  "ThePrimeagen/harpoon",
	  event = "VeryLazy",
	  branch = "harpoon2",
	  dependencies = { "nvim-lua/plenary.nvim" }
  },

  { "FabijanZulj/blame.nvim", cmd = "ToggleBlame" },
  { "airblade/vim-gitgutter", event = "VeryLazy" },
  {
    "ianding1/leetcode.vim",
    cmd = "Leetcode",
    config = function()
      vim.g.leetcode_browser = "firefox"
      vim.g.leetcode_solution_filetype = "python3"
    end,
  },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" }, -- shows colors in code which is cool!
  { "echasnovski/mini.nvim", version = "*" }, -- echasnovski jest przechuj
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }, -- when you press "{" sign "}" appears automagically
  { "mbbill/undotree", event = "VeryLazy" },
  { "numToStr/Navigator.nvim", lazy = true, config = function() require("Navigator").setup {} end }, -- this is sth for tmux integration that can change window in split tmux
  { "kdheepak/lazygit.nvim", cmd = "LazyGit", dependencies = { "nvim-lua/plenary.nvim" } },
  { "RRethy/vim-illuminate", event = "VeryLazy" }, -- Vim plugin for automatically highlighting other uses of the word under the cursor
  { "vimwiki/vimwiki", event = "VeryLazy" }, -- good plugin for notes cheatsheet diary todo
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        keymaps = {
          ["<C-i>"] = "actions.select",
          ["<C-o>"] = "actions.parent",
        },
      }
    end,
  },
  {
    "CRAG666/betterTerm.nvim",
    config = function()
      require("betterTerm").setup {
        prefix = "Term_",
        startInserted = false,
        position = "bot",
        size = 18,
      }
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  { "nvim-pack/nvim-spectre", cmd = "Spectre" },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
}
