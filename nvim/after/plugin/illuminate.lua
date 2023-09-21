if not vim.g.vscode then
require("illuminate").configure {}

-- change the highlight style
-- is was  link = "Visual"
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
  end,
})
end
