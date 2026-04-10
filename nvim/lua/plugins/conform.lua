return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local langs = require("lang")

		conform.setup({
			formatters_by_ft = langs.formatters_by_ft(),
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 3000,
			},
		})

		langs.apply_formatter_configs(conform)

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
