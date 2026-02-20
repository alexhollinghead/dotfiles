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
				vue = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				php = { "phpcbf" },
				json = { "prettierd" },
				python = { "ruff_format" },
				lua = { "stylua" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				async = false,
				lsp_fallback = true,
				timeout_ms = 3000,
			},
		})

		require("conform").formatters.phpcbf = {
			args = { "--standard=PSR2", "$FILENAME" },
			stdin = false,
		}

		require("conform").formatters.stylua = {
			prepend_args = { "--column-width", "80" },
		}

		require("conform").formatters.ruff_format = {
			args = { "format", "--line-length", "79", "--force-exclude", "--stdin-filename", "$FILENAME", "-" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
