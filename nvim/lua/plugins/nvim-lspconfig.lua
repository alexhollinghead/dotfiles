return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- Global Configuration
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local map = vim.keymap.set
		local on_attach = function(_, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = "LSP " .. desc }
			end

			map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
			map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
			map(
				"n",
				"gi",
				vim.lsp.buf.implementation,
				opts("Go to implementation")
			)
			map(
				"n",
				"<leader>sh",
				vim.lsp.buf.signature_help,
				opts("Show signature help")
			)
			map(
				"n",
				"<leader>D",
				vim.lsp.buf.type_definition,
				opts("Go to type definition")
			)

			map("n", "gr", vim.lsp.buf.references, opts("Show references"))
		end

		-- Server Configuration

		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--pch-storage=memory",
				"--clang-tidy",
				"--completion-style=detailed",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
			on_attach = function(client, bufnr)
				client.server_capabilities.signatureHelpProvider = false
				on_attach(client, bufnr)
			end,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})
		lspconfig.pyright.setup({ capabilities = capabilities })
	end,
}
