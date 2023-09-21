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
  { "cljoly/telescope-repo.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-github.nvim",
    },
  },
  -- { "nvim-telescope/telescope-hop.nvim" },
  { "nvim-telescope/telescope-project.nvim" }

}
