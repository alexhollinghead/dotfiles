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

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSP servers to install
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"clangd",
				"vtsls",
				"html",
				"intelephense",
			},
			automatic_installation = true,
			automatic_enable = false,
		})

		-- Formatters and linters to install
		-- Note: black, flake8, cpplint excluded - install via homebrew/pip instead
		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"prettierd",
				"stylua",
				"clang-format",
				"phpcbf",
				-- Linters
				"luacheck",
				"eslint_d",
				"phpcs",
			},
		})
	end,
}
