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

  require "config.later"
  require("mini.surround").setup {}

  local telescope = require "telescope"
  telescope.load_extension "repo"
  telescope.load_extension "project"
end
