return {
	plugins = {
		{ "mfussenegger/nvim-dap-python" },
	},

	treesitter = { "python" },

	mason = {
		lsp = { "basedpyright" },
		tools = {}, -- ruff installed via brew/pip, not mason
	},

	lsp = {
		server = "basedpyright",
		config = {
			settings = {
				basedpyright = {
					disableOrganizeImports = true,
					analysis = {
						ignore = { "*" },
					},
				},
			},
		},
	},

	formatters = {
		by_ft = { python = { "ruff_format" } },
		config = {
			ruff_format = {
				args = {
					"format",
					"--line-length",
					"79",
					"--force-exclude",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
			},
		},
	},

	linters = {
		by_ft = { python = { "ruff" } },
		config = {
			ruff = function(lint)
				table.insert(lint.linters.ruff.args, 2, "--line-length")
				table.insert(lint.linters.ruff.args, 3, "79")
			end,
		},
	},

	dap = {
		mason = { "debugpy" },
		setup = function(_dap, _dapui)
			require("dap-python").setup()
		end,
	},
}
