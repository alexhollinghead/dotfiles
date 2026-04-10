return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
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

		for server, def in pairs(require("lang").lsp_servers()) do
			local cfg = vim.deepcopy(def.config)
			cfg.capabilities = capabilities
			cfg.on_attach = function(client, bufnr)
				if def.post_attach then
					def.post_attach(client, bufnr)
				end
				on_attach(client, bufnr)
			end
			vim.lsp.config(server, cfg)
			vim.lsp.enable(server)
		end
	end,
}
