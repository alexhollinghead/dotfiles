return {
	treesitter = { "c", "cpp" },

	mason = {
		lsp = { "clangd" },
		tools = { "clang-format" }, -- cpplint installed via brew, not mason
	},

	lsp = {
		server = "clangd",
		-- Disable signatureHelp from clangd (clangd's is noisy; prefer another source)
		post_attach = function(client, _)
			client.server_capabilities.signatureHelpProvider = false
		end,
		config = {
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--pch-storage=memory",
				"--clang-tidy",
				"--completion-style=detailed",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
		},
	},

	formatters = {
		by_ft = { cpp = { "clang-format" } },
		config = {},
	},

	linters = {
		by_ft = { cpp = { "cpplint" } },
		config = {
			cpplint = function(lint)
				lint.linters.cpplint.args = { "--filter=-legal/copyright" }
			end,
		},
	},
}
