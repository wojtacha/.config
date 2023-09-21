return {
  { "tpope/vim-fugitive" },
  -- { "TaDaa/vimade", config = function() end },
  { "ThePrimeagen/vim-be-good" },
  { "ThePrimeagen/harpoon" },
  {
    "FabijanZulj/blame.nvim",
  },
  { "airblade/vim-gitgutter" },
  {
    "ianding1/leetcode.vim",
    config = function()
      vim.g.leetcode_browser = "firefox"
      vim.g.leetcode_solution_filetype = "python3"
    end,
  },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
  { "echasnovski/mini.nvim", version = "*" },
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
  { "mbbill/undotree" },
  { "natecraddock/workspaces.nvim" },
  { "numToStr/Navigator.nvim", config = function() require("Navigator").setup() end },
  { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
}
