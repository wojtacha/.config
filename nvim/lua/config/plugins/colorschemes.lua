return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local catppuccin = require "catppuccin"
      catppuccin.setup {
        transparent_background = false,
        term_colors = false,
        integrations = {
          telescope = true,
          --     which_key = true,
          --    treesitter = true,
          --     native_lsp = {
          --       enabled = true,
          --       virtual_text = {errors = "italic", hints = "italic", warnings = "italic", information = "italic"},
          --       underlines = {errors = "underline", hints = "underline", warnings = "underline", information = "underline"}
          --      },
          --     lsp_trouble = false,
          --     lsp_saga = false,
          --     gitgutter = false,
          --     gitsigns = true,
          --     nvimtree = {enabled = true, show_root = true},
          --     indent_blankline = {enabled = true, colored_indent_levels = true},
          --     dashboard = true,
          --     neogit = false,
          --     vim_sneak = false,
          --     fern = false,
          --     barbar = false,
          --     bufferline = true,
          --     markdown = false,
          --     lightspeed = false,
          --     ts_rainbow = true,
          --     hop = false
        },
        -- to z jakiegos powodu nie dziala  styles = {comments = "italic", functions = "italic", keywords = "italic", strings = "NONE", variables = "NONE"},
      }

      -- vim.cmd "highlight CursorLine term=bold cterm=NONE ctermbg=none ctermfg=none gui=bold"
      -- vim.opt.cursorlineopt ="highlight CursorLine term=bold cterm=NONE ctermbg=none ctermfg=none gui=bold"
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1001,
    name = "onedark",
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1004,
    config = function() require("nordic").load() end,
    name = "nordic",
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox" },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1005,
    opts = {},
  },
}
