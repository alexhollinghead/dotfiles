return {
	plugins = {
		{ "leoluz/nvim-dap-go" },
	},

	treesitter = { "go" },

	mason = {
		lsp = {}, -- gopls installed via `go install`, not mason
		tools = {}, -- golangci-lint installed via brew, not mason
	},

	lsp = {
		server = "gopls",
		config = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		},
	},

	formatters = {
		by_ft = { go = { "goimports" } },
		config = {},
	},

	linters = {
		by_ft = { go = { "golangcilint" } },
		config = {
			-- Filter out typecheck diagnostics (duplicates from gopls)
			golangcilint = function(lint)
				local orig = lint.linters.golangcilint.parser
				lint.linters.golangcilint.parser = function(output, bufnr, cwd)
					local diags = orig(output, bufnr, cwd)
					return vim.tbl_filter(function(d)
						return d.source ~= "typecheck"
					end, diags)
				end
			end,
		},
	},

	dap = {
		mason = { "delve" },
		setup = function(_dap, _dapui)
			require("dap-go").setup()
		end,
	},
}
