return {
  { "tpope/vim-fugitive", cmd = "Git" },
  { "ThePrimeagen/harpoon", event = "VeryLazy" },
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
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
  { "echasnovski/mini.nvim", version = "*" },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
  { "mbbill/undotree", event = "VeryLazy" },
  { "numToStr/Navigator.nvim", lazy = true, config = function() require("Navigator").setup {} end },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit", dependencies = { "nvim-lua/plenary.nvim" } },
  { "RRethy/vim-illuminate", event = "VeryLazy" },
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
