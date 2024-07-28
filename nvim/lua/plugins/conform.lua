return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				python = { "black" },
				lua = { "stylua" },
			},
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		require("conform").formatters.black = {
			prepend_args = { "--line-length", "79" },
		}
		require("conform").formatters.stylua = {
			prepend_args = { "--column-width", "80" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
