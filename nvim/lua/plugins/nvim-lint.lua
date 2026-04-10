return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		local langs = require("lang")

		lint.linters_by_ft = langs.linters_by_ft()
		langs.apply_linter_configs(lint)

		local lint_augroup = vim.api.nvim_create_augroup("lint", {
			clear = true,
		})

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			group = lint_augroup,
			callback = function()
				local ok, err = pcall(lint.try_lint)
				if not ok then
					-- Only show error if it's not about a missing linter executable
					if not (err:match("ENOENT") or err:match("no such file")) then
						vim.notify(
							"Linting error: " .. err,
							vim.log.levels.ERROR
						)
					end
				end
			end,
		})
	end,
}
