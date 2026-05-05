return {
	treesitter = { "html" },

	mason = {
		lsp = { "html", "emmet_language_server" },
		tools = {}, -- prettierd already pulled in by typescript.lua
	},

	lsp = {
		server = "html",
		config = {},
	},

	lsp_servers = {
		{
			server = "emmet_language_server",
			config = {
				filetypes = { "html", "php", "css" },
			},
		},
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
