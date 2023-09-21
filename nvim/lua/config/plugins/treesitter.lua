local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = function() require("nvim-treesitter.install").update { with_sync = true } end,
}

local playground = { "nvim-treesitter/playground" }
return { treesitter, playground }
