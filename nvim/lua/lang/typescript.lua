return {
	treesitter = { "javascript", "typescript", "tsx" },

	mason = {
		lsp = { "vtsls" },
		tools = { "prettierd", "eslint_d" },
	},

	lsp = {
		server = "vtsls",
		config = {
			filetypes = {
				"typescript",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"vue",
			},
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = vim.fn.stdpath("data")
									.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
								languages = { "vue" },
								configNamespace = "typescript",
							},
						},
					},
				},
			},
		},
	},

	formatters = {
		by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			svelte = { "prettierd" },
			vue = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
		},
		config = {},
	},

	linters = {
		by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
		},
		config = {},
	},
}
