return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    "folke/neodev.nvim",
    config = function() require("neodev").setup {} end,
  },
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
    dependencies = { "stevearc/dressing.nvim" },
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

  { "echasnovski/mini.nvim", version = "*", config = function() require("mini.surround").setup {} end }, -- echasnovski jest przechuj

  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }, -- when you press "{" sign "}" appears automagically

  { "mbbill/undotree", event = "VeryLazy" },

  { "vimwiki/vimwiki", event = "VeryLazy" }, -- good plugin for notes cheatsheet diary todo

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
        },
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
          ["H"] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      }
    end,
  },
  {
    -- config = function()
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    -- config = function()
    --   require("gx").setup {
    --     open_browser_app = "os_specific", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
    --     open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
    --     handlers = {
    --       plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
    --       github = true, -- open github issues
    --       brewfile = true, -- open Homebrew formulaes and casks
    --       package_json = true, -- open dependencies from package.json
    --       search = true, -- search the web/selection on the web if nothing else is found
    --     },
    --     handler_options = {
    --       search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
    --     },
    --   }
    -- end,
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

  { "tpope/vim-dadbod" },
  {
    "kristijanhusak/vim-dadbod-ui",
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
  { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
}
