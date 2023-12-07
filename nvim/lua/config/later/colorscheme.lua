require("catppuccin").setup {
  transparent_background = false,
  term_colors = true,
  integrations = {
    telescope = true,
    which_key = true,
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtualtext = { }
    },
    bufferline = true,
    lsp_saga = true,
  },
}
-- vim.cmd.colorscheme "tokyonight"
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "aurora"
-- vim.cmd.colorscheme "onedark"
-- vim.cmd.colorscheme "nordic"
-- vim.cmd.colorscheme "rose-pine"
-- vim.cmd.colorscheme "gruvbox"
