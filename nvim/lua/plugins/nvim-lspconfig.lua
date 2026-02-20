return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()

		-- Global Configuration
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

		-- Server Configuration using vim.lsp.config (new Neovim 0.11+ API)
		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("intelephense", {
			filetypes = { "php" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("clangd", {
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

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		local vue_ls_root = vim.fn.stdpath("data")
			.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			on_attach = on_attach,
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
								location = vue_ls_root,
								languages = { "vue" },
								configNamespace = "typescript",
							},
						},
					},
				},
			},
		})

		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				basedpyright = {
					disableOrganizeImports = true,
					analysis = {
						ignore = { "*" },
					},
				},
			},
		})

		-- Enable the configured servers
		vim.lsp.enable("html")
		vim.lsp.enable("intelephense")
		vim.lsp.enable("clangd")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("vtsls")
		vim.lsp.enable("basedpyright")
	end,
}
