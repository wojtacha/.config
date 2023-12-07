if not vim.g.vscode then
  --- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yetauto
  ---@param plugin string The plugin to search for
  ---@return boolean available # Whether the plugin is available

  local wk = require "which-key"

  local telescope = require "telescope.builtin"
  local telescope_state = require "telescope.state"
  local last_search = nil

  wk.register {
    ["<leader>"] = {
      f = {
        name = "+find",
        b = "[F]ind open [b]uffers",
        s = "[F]ile [s]earch - inside live grep",
        g = "[F]ind [g]it files",
        f = "[F]ind [f]iles",
        h = "[F]ind [h]elp",
      },
    },
  }
  vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
  vim.keymap.set("n", "<leader>fg", telescope.git_files, {})
  vim.keymap.set("n", "<leader>fs", telescope.live_grep, {})
  vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
  vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

  -- this is weird but on polish mac keyboard this is how to map <A-h/l>
  vim.keymap.set("n", "ķ", "<C-w>>", { desc = "Resize window left" })
  vim.keymap.set("n", "ł", "<C-w><", { desc = "Resize window right" })
  vim.keymap.set("n", "∆", "<C-w>+", { desc = "Resize window left" })
  vim.keymap.set("n", "Ż", "<C-w>-", { desc = "Resize window right" })

  -- Netwr
  vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Toggle Explorer" })
  -- NeoTree
  vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  vim.keymap.set("n", "<F1>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  vim.keymap.set("n", "<leader>pr", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Neotree" })
  vim.keymap.set("n", "<F2>", vim.cmd.UndotreeToggle)
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

  -- Harpoon
  -- vim.keymap.set("n", "<c-e>", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon toggle", noremap = true })
  -- vim.keymap.set("n", "<c-q>", require("harpoon.ui").nav_next, { desc = "next Harpoon mark", noremap = true })
  -- vim.keymap.set("n", "<c-n>", require("harpoon.mark").add_file, { desc = "add harpoon mark", noremap = true })

  -- [[ Basic Keymaps ]]
  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

  -- Remap for dealing with word wrap
  vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  vim.keymap.set("i", "kj", "<C-[>", { desc = "yet another esc", noremap = true })

  vim.keymap.set(
    "n",
    "<leader>cf",
    function() require("conform").format { async = true, lsp_fallback = true } end,
    { desc = "Format code with formatter", noremap = true }
  )

  vim.keymap.set(
    "n",
    "<leader>rf",
    function() require("config.later.formatter").format() end,
    { desc = "Format code with formatter", noremap = true }
  )
  -- Navigator
  vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Go to right window", noremap = true })
  vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Go to up window", noremap = true })
  vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Go to down window", noremap = true })
  vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Go to left window", noremap = true })

  vim.keymap.set({ "n", "x" }, "x", [["_x]], { desc = "x command send char to black hole register", noremap = true })
  vim.keymap.set(
    "x",
    "p",
    [["_dP]],
    { desc = "another paste command send char to black hole register", noremap = true }
  )
  vim.keymap.set(
    { "n" },
    "<Esc><Esc>",
    "<Esc>:nohlsearch<CR><Esc>",
    { desc = "Unhighlight search occurences", silent = true, noremap = true }
  )

  vim.keymap.set(
    { "n", "v" },
    "<leader>gg",
    function() require("lazygit").lazygit() end,
    { desc = "LazyGit", noremap = true }
  )
  vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Toggle git blame", noremap = true })
  vim.keymap.set(
    { "n", "v" },
    "<leader>gb",
    "<cmd>ToggleBlame window<cr>",
    { desc = "Toggle git blame", noremap = true }
  )
  wk.register {
    ["<leader>"] = {
      g = {
        name = "+git",
        b = "Git [b]lame",
        s = "Git [s]tages - tpope",
        g = "Git lazy[g]it",
      },
    },
  }

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions

  wk.register {
    ["<leader>"] = {
      d = {
        name = "[D]iagnostic",
        i = "[d]iagnostic [i]nfo",
        l = "[d]iagnostic [l]ist",
        h = "[d]iagnostic [h]ide",
        n = "[d]iagnostic [n]ext also ]d",
        p = "[d]iagnostic [p]rev also [d",
      },
    },
  }
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
  vim.keymap.set("n", "<leader>dh", vim.diagnostic.hide, { desc = "[d]iagnostic [h]ide" })
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[d]iagnostic [n]ext" })
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[d]iagnostic [p]rev" })

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

  -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      wk.register {
        g = {
          name = "LSP",
          D = "[D]eclaration",
          d = "[d]efinition",
        },
        ["<leader>"] = {
          D = "type [D]efinition",
          l = {
            name = "+LSP",
            i = "[i]mplementation",
            D = "[D]eclaration or gD",
            d = "[d]efinition or gd",
            r = "[r]eferences or gr",
          },
          sh = "LSP [s]ignature [h]elp",
          r = {
            name = "+re",
            n = "LSP +[r]e[n]ame",
          },
          wl = "LSP [w]orkspace [f]olders",
          c = {
            name = "+code",
            a = "[c]ode [a]ctions",
            f = "[c]ode [f]ormat",
          },
          K = "LSP hover",
        },
      }
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "declaration" })
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = ev.buf, desc = "definition" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = ev.buf, desc = "references" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "hover" })
      vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "hover" })
      vim.keymap.set(
        "n",
        "<leader>li",
        function() print(vim.lsp.buf.implementation()) end,
        { buffer = ev.buf, desc = "implementation" }
      )
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "signature_help" })
      vim.keymap.set(
        "n",
        "<leader>wa",
        vim.lsp.buf.add_workspace_folder,
        { buffer = ev.buf, desc = "add_workspace_folder" }
      )
      vim.keymap.set(
        "n",
        "<leader>wr",
        vim.lsp.buf.remove_workspace_folder,
        { buffer = ev.buf, desc = "remove_workspace_folder" }
      )
      vim.keymap.set(
        "n",
        "<leader>wf",
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        { buffer = ev.buf, desc = "list_workspace_folders" }
      )
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "type_definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, buffer = ev.buf, desc = "rename" })
      -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code_action" })
      vim.keymap.set(
        { "n", "v" },
        "<leader>ca",
        "<cmd>Lspsaga code_action<cr>",
        { buffer = ev.buf, desc = "code_action" }
      )
    end,
  })
  vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Jump down half page and center" })
  vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Jump up half page and center" })
  vim.keymap.set("n", "n", "nzz", { desc = "Next search occurence and focus view" })
  vim.keymap.set("n", "N", "Nzz", { desc = "Previous search occurence and focus view" })

  --====== TERMINAL
  local betterTerm = require "betterTerm"
  wk.register {
    ["<leader>"] = {
      t = {
        name = "+terminal",
        D = "[D]eclaration",
        t = "[t]oggle",
        s = "[s]elect",
      },
    },
  }
  -- toggle firts term
  vim.keymap.set({ "n", "t" }, "<leader>tt", betterTerm.open, { desc = "Open terminal" })
  -- Select term focus
  vim.keymap.set({ "n" }, "<leader>ts", betterTerm.select, { desc = "Select terminal" })
  -- Create new term
  local current = 2
  vim.keymap.set({ "n" }, "<leader>tn", function()
    betterTerm.open(current)
    current = current + 1
  end, { desc = "New terminal" })
  vim.keymap.set({ "t" }, "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window", noremap = true })
  vim.keymap.set({ "t" }, "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to up window", noremap = true })
  vim.keymap.set({ "t" }, "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to down window", noremap = true })
  vim.keymap.set({ "t" }, "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window", noremap = true })
end
