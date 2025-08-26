return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()

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

		local vue_ls_root = vim.fn.stdpath("data")
			.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
		local tsdk = vim.fn.stdpath("data")
			.. "/mason/packages/vtsls/node_modules/typescript/lib"

		local vue_language_server_path = vim.fn.stdpath("data")
			.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		lspconfig.vtsls.setup({
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

		-- start vue_ls (Volar) for template intelligence, diagnostics, code actions
		lspconfig.vue_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				typescript = { tsdk = tsdk }, -- make sure Volar uses the same TS as vtsls
			},
			-- optional: limit to vue to avoid overlap
			filetypes = { "vue" },
		})

		lspconfig.pyright.setup({ capabilities = capabilities })
	end,
}
