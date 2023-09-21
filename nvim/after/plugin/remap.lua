if not vim.g.vscode then
--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yetauto
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available

local function is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

local wk = require "which-key"

local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- this is weird but on polish mac keyboard this is how to map <A-h/l>
vim.keymap.set("n", "ķ", "<C-w>>", { desc = "Resize window left" })
vim.keymap.set("n", "ł", "<C-w><", { desc = "Resize window right" })
vim.keymap.set("n", "∆", "<C-w>+", { desc = "Resize window left" })
vim.keymap.set("n", "Ż", "<C-w>-", { desc = "Resize window right" })

-- NeoTree
if is_available "neo-tree.nvim" then
  vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  vim.keymap.set("n", "<F1>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  vim.keymap.set("n", "<leader>pr", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Neotree" })
end

vim.keymap.set("n", "<F3>", require("telescope").extensions.repo.list, { desc = "Toggle Repo Explorer" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope commands<cr>", { desc = "Toggle Commands Explorer" })
vim.keymap.set("n", "<F4>", function()
  require("telescope").extensions.project.project {
    display_type = "full",
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<C-j>", require("telescope.actions").move_selection_next)
      map("i", "<C-k>", require("telescope.actions").move_selection_previous)
      -- Project key mappings
      local _actions = require "telescope._extensions.project.actions"
      map("n", "d", _actions.delete_project)
      map("n", "r", _actions.rename_project)
      map("n", "a", _actions.add_project)
      map("n", "A", _actions.add_project_cwd)
      map("n", "f", _actions.find_project_files)
      map("n", "b", _actions.browse_project_files)
      map("n", "s", _actions.search_in_project_files)
      map("n", "R", _actions.recent_project_files)
      map("n", "w", _actions.change_working_directory)

      map("i", "<c-d>", _actions.delete_project)
      map("i", "<c-r>", _actions.rename_project)
      map("i", "<c-a>", _actions.add_project)
      map("i", "<c-A>", _actions.add_project_cwd)
      map("i", "<c-f>", _actions.find_project_files)
      map("i", "<c-b>", _actions.browse_project_files)
      map("i", "<c-s>", _actions.search_in_project_files)
      map("i", "<c-p>", _actions.recent_project_files)
      map("i", "<c-w>", _actions.change_working_directory)

      -- Workspace key mappings
      map("i", "<c-w>", _actions.change_workspace)
      return true
    end,
  }
end, { desc = "Toggle Project Explorer", noremap = true, silent = true })
vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle)

-- Harpoon
vim.keymap.set("n", "<c-e>", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon toggle", noremap = true })
vim.keymap.set("n", "<c-q>", require("harpoon.ui").nav_next, { desc = "next Harpoon mark", noremap = true })
vim.keymap.set("n", "<c-n>", require("harpoon.mark").add_file, { desc = "add harpoon mark", noremap = true })

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("i", "kj", "<C-[>", { desc = "yet another esc", noremap = true })

vim.keymap.set("n", "<leader>r", vim.cmd.Format, { desc = "Format code with formatter" })

-- Navigator
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Go to right window", noremap = true })
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Go to up window", noremap = true })
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Go to down window", noremap = true })
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Go to left window", noremap = true })

-- vim.keymap.set({ "n", "v" }, "<C-i>", "<C-o>", { desc = "Go [o]utside", noremap = true })
-- vim.keymap.set({ "n", "v" }, "<C-o>", "<C-i>", { desc = "Go [i]nside", noremap = true })

vim.keymap.set("x", "x", [["_x]], { desc = "x command send char to black hole register", noremap = true })
vim.keymap.set("x", "p", [["_dP]], { desc = "another paste command send char to black hole register", noremap = true })
vim.keymap.set(
  { "n" },
  "<Esc><Esc>",
  "<Esc>:nohlsearch<CR><Esc>",
  { desc = "Unhighlight search occurences", silent = true, noremap = true }
)
-- -- LeetCode
-- -- Move it to after/config.lua
-- vim.g.leetcode_browser = "brave"
-- vim.g.leetcode_solution_filetype = "python3"
-- vim.keymap.set({ "n", "v" }, "<leader>ll", "<cmd>LeetCodeList<cr>", { desc = "LeetCodeList", noremap = true })
-- vim.keymap.set({ "n", "v" }, "<leader>lt", "<cmd>LeetCodeTest<cr>", { desc = "LeetCodeTest", noremap = true })
-- vim.keymap.set({ "n", "v" }, "<leader>ls", "<cmd>LeetCodeSubmit<cr>", { desc = "LeetCodeSubmit", noremap = true })
-- vim.keymap.set({ "n", "v" }, "<leader>li", "<cmd>LeetCodeSignIn<cr>", { desc = "LeetCodeSignIn", noremap = true })

vim.keymap.set({ "n", "v" }, "<leader>gg", require("lazygit").lazygit, { desc = "LazyGit", noremap = true })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Toggle git blame", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>gb", "<cmd>ToggleBlame window<cr>", { desc = "Toggle git blame", noremap = true })
wk.register {
  ["<leader>"] = {
    g = {
      name = "[G]it",
      b = "Git [b]lame",
      s = "Git [s]tages - tpope",
      g = "Git lazy[g]it",
    },
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.keymap.set(
  "n",
  "<leader>di",
  "<cmd>lua vim.diagnostic.open_float()<CR>",
  { desc = "[d]iagnostic [i]nformation", noremap = true, silent = true }
)
-- vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[d]iagnostic [l]ist" })
-- Illuminate

wk.register {
  g = {
    name = "[g]o",
    n = "[g]o to [n]ext underline reference",
    N = "[g]o to [p]revious underline reference",
  },
}
vim.keymap.set("n", "gn", require("illuminate").goto_next_reference, { desc = "Move to next reference" })
vim.keymap.set("n", "gp", require("illuminate").goto_prev_reference, { desc = "Move to previous reference" })
-- vim.keymap.set("o", "<C-[>", require("illuminate").textobj_select)
-- vim.keymap.set("x", "<C-[>", require("illuminate").textobj_select)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    wk.register {
      g = {
        name = "LSP",
        D = "[D]eclaration",
        d = "[d]efinition",
      },
      ["<leader>"] = {
        g = {
          name = "LSP",
          i = "[g]o to [i]mplementation",
          D = "[D]eclaration",
          d = "[d]efinition",
        },
        sh = "LSP [s]ignature [h]elp",
        rn = "LSP [r]e[n]ame",
        td = "LSP [t]ype [d]efinition",
        wl = "LSP [w]orkspace [f]olders",
        gr = "LSP [g]o [r]eferences",
        ca = "LSP [c]ode [a]ctions",
	K = "LSP hover"
      },
    }
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts, { desc = "declaration" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts, { desc = "definition" })
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts, { desc = "hover" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "hover" })
    vim.keymap.set(
      "n",
      "<leader>gi",
      function() print(vim.lsp.buf.implementation()) end,
      opts,
      { desc = "implementation" }
    )
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts, { desc = "signature_help" })
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts, { desc = "add_workspace_folder" })
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts, { desc = "remove_workspace_folder" })
    vim.keymap.set(
      "n",
      "<leader>wf",
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      opts,
      { desc = "list_workspace_folders" }
    )
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts, { desc = "type_definition" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "rename" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "code_action" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts, { desc = "references" })
  end,
})
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Jump down half page and center" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Jump up half page and center" })
vim.keymap.set("n", "n", "nzz", { desc = "Next search occurence and focus view" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search occurence and focus view" })

--====== TERMINAL
vim.keymap.set({ "t" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window", noremap = true })
vim.keymap.set({ "t" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to up window", noremap = true })
vim.keymap.set({ "t" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to down window", noremap = true })
vim.keymap.set({ "t" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window", noremap = true })
end
