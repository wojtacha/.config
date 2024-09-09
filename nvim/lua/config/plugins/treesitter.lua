local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = function() require("nvim-treesitter.install").update { with_sync = true } end,
}
local objects = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = {
    function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            keymaps = {

              -- Built-in captures.
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
      }
    end,
  },
}

local playground = { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }

return { treesitter, playground }
