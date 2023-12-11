return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "folke/neodev.nvim" },
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()
    end,
  },

  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      require("overseer").setup {
        default_template_prompt = "allow",
        log = {
          {
            type = "file",
            filename = "overseer.log",
            level = vim.log.levels.DEBUG, -- or TRACE for max verbosity
          },
        },
        templates = { "builtin", "user.run_script" },
      }
    end,
  },


  { "norcalli/nvim-colorizer.lua", event = "VeryLazy" }, -- shows colors in code which is cool!

  { "echasnovski/mini.nvim", version = "*" }, -- echasnovski jest przechuj

  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }, -- when you press "{" sign "}" appears automagically

  { "mbbill/undotree", event = "VeryLazy" },



  { "vimwiki/vimwiki", event = "VeryLazy" }, -- good plugin for notes cheatsheet diary todo
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        keymaps = {
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["<BS>"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["."] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["H"] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      }
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        extra = {
          ---Add comment on the line above
          above = "gcO",
          ---Add comment on the line below
          below = "gco",
          ---Add comment at the end of line
          eol = "gcA",
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
}
