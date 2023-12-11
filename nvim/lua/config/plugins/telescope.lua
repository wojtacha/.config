return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-github.nvim" },
    config = function()
      local actions = require "telescope.actions"
      require("telescope").setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "-g",
            "!node_modules/**",
            "-g",
            "!.git/**",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          path_display = { "smart" },
          file_ignore_patterns = { "^.git/" },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = {
                actions.move_selection_next,
                type = "action",
                opts = { nowait = true, silent = true },
              },
              ["<C-d>"] = actions.delete_buffer,
              ["<C-k>"] = {
                actions.move_selection_previous,
                type = "action",
                opts = { nowait = true, silent = true },
              },
            },
            n = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            hidden = true,
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension "ui-select"
    end,
  },
  -- { "nvim-telescope/telescope-hop.nvim" },
}
