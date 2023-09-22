return {
  { "tpope/vim-fugitive", cmd = "Git" },
  { "ThePrimeagen/harpoon" },
  { "FabijanZulj/blame.nvim", cmd = "ToggleBlame", },
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
  { "mbbill/undotree" },
  { "numToStr/Navigator.nvim", lazy = true, config = function() require("Navigator").setup() end },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit", dependencies = { "nvim-lua/plenary.nvim" } },
  { "RRethy/vim-illuminate", event = "VeryLazy" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  { "nvim-pack/nvim-spectre", cmd = "Spectre" },
}
