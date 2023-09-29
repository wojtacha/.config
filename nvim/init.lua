if vim.g.vscode then
  print "VSCODE KURWA ON"
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
  vim.cmd [[source $HOME/.config/nvim/vscode/easymotion-config.vim]]
else
  require "config"
  require("lazy").setup "config.plugins"
  require("nvim-treesitter.install").compilers = { "gcc" }

  -- LSP ZERO --
  local lsp = require "lsp-zero"
  local coq = require "coq"
  lsp.preset {}
  lsp.on_attach(function(client, bufnr) lsp.default_keymaps { buffer = bufnr } end)
  -- (Optional) Configure lua language server for neovim

  require("neodev").setup {
    -- add any options here, or leave empty to use the default settings
  }

  require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
  }
  local lspconfig = require "lspconfig"
  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
  lspconfig.gopls.setup(coq.lsp_ensure_capabilities())
  lspconfig.sourcekit.setup {
    cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
    single_file_support = true,
  }
  lspconfig.tsserver.setup {
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  }
  lspconfig.yamlls.setup {
    settings = {
      yaml = {
        format = {
          enable = true,
        },
        hover = true,
        completion = true,

        customTags = {
          "!fn",
          "!And",
          "!If",
          "!Not",
          "!Equals",
          "!Or",
          "!FindInMap sequence",
          "!Base64",
          "!Cidr",
          "!Ref",
          "!Ref Scalar",
          "!Sub",
          "!GetAtt",
          "!GetAZs",
          "!ImportValue",
          "!Select",
          "!Split",
          "!Join sequence",
        },
      },
    },
  }

  lsp.setup()

  local cmp_action = require("lsp-zero").cmp_action()
  local cmp_format = require("lsp-zero").cmp_format()
  require("luasnip.loaders.from_vscode").lazy_load()
  local cmp = require "cmp"
  cmp.setup {
    preselect = cmp.PreselectMode.None,
    mapping = {
      ["<C-j>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<C-k>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      ["<cr>"] = function(fallback)
        if cmp.visible() then
          cmp.confirm { select = true }
        else
          fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
        end
      end,
      ["<C-l>"] = function(fallback)
        if cmp.visible() then
          cmp.confirm()
        else
          fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
        end
      end,
      ["<Tab>"] = cmp_action.luasnip_jump_forward(),
      ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,

        -- copied from cmp-under, but I don't think I need the plugin for this.
        -- I might add some more of my own.
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find "^_+"
          local _, entry2_under = entry2.completion_item.label:find "^_+"
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,

        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    snippet = {
      expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    sources = cmp.config.sources {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
    },
    experimental = {
      ghost_text = true,
    },
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
  }

  require "config.later"
  require("mini.surround").setup {}

  local telescope = require "telescope"
  telescope.load_extension "repo"
  telescope.load_extension "project"
end
