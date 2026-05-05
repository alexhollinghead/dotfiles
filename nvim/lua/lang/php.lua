return {
	treesitter = {},

	mason = {
		lsp = { "intelephense" },
		tools = { "phpcbf", "phpcs" },
	},

	lsp = {
		server = "intelephense",
		config = {
			filetypes = { "php" },
		},
	},

	formatters = {
		by_ft = { php = { "prettierd", "phpcbf", stop_after_first = true } },
		config = {
			phpcbf = {
				args = { "--standard=PSR2", "$FILENAME" },
				stdin = false,
			},
		},
	},

	linters = {
		by_ft = { php = { "phpcs" } },
		config = {
			phpcs = function(lint)
				lint.linters.phpcs.args = { "default_standard", "PSR2" }
			end,
		},
	},
}
