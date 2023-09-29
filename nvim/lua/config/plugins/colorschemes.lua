return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
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
    lazy = true,
    priority = 1001,
    name = "onedark",
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1004,
    config = function() require("nordic").load() end,
    name = "nordic",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "auto",
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = "moon",
        bold_vert_split = false,
        dim_nc_background = true,
        disable_background = false,
        disable_float_background = true,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
          background = "base",
          background_nc = "_experimental_nc",
          panel = "surface",
          panel_nc = "base",
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",

          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",

          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },
          -- or set all headings at once
          -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
          ColorColumn = { bg = "rose" },

          -- Blend colours against the "base" background
          CursorLine = { bg = "foam", blend = 10 },
          StatusLine = { fg = "love", bg = "love", blend = 10 },

          -- By default each group adds to the existing config.
          -- If you only want to set what is written in this config exactly,
          -- you can set the inherit option:
          Search = { bg = "gold", inherit = false },
        },
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", lazy = true },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    priority = 1005,
    opts = {},
  },
}
