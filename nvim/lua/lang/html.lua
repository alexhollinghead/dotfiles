return {
	treesitter = { "html" },

	mason = {
		lsp = { "html" },
		tools = {}, -- prettierd already pulled in by typescript.lua
	},

	lsp = {
		server = "html",
		config = {},
	},

	formatters = {
		by_ft = { html = { "prettierd" } },
		config = {},
	},

	linters = {
		by_ft = {},
		config = {},
	},
}
