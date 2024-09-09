return {
  { "airblade/vim-gitgutter", event = "VeryLazy" }, -- show git information in current buffer
  { "tpope/vim-fugitive", cmd = "Git" },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit", dependencies = { "nvim-lua/plenary.nvim" } },
}
