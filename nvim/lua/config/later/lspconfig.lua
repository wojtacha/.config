local lsp = require "lsp-zero"
local lsp_zero_preset = lsp.preset {}

lsp.on_attach(function(client, bufnr) lsp.default_keymaps { buffer = bufnr } end)

-- (Optional) Configure lua language server for neovim

require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "rust_analyzer" },
}

local lspconfig = require "lspconfig"

lsp.skip_server_setup { "jdtls", "ruby_ls" }

lspconfig.lua_ls.setup(lsp_zero_preset.nvim_lua_ls())

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
-- PYTHON --
-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
lspconfig.ruff_lsp.setup {
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		}
	}
}

lspconfig.pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					-- this ignores the E501 line length error, I use ruff for that
					ignore = { 'E501' },
				}
				-- black = {enabled = false},
			}
		}
	}
}

lspconfig.jedi_language_server.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
	capabilities = capabilities,
}

lspconfig.yamlls.setup {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
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
