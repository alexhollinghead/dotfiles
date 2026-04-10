return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = require("lang").mason_lsp(),
			automatic_installation = true,
			automatic_enable = false,
		})

		-- Note: tools installed via brew/pip/go are omitted from lang files
		-- so they don't appear here. See individual lang files for details.
		mason_tool_installer.setup({
			ensure_installed = require("lang").mason_tools(),
		})
	end,
}
