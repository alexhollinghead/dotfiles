return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			lua = { "luacheck" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "ruff" },
			cpp = { "cpplint" },
			php = { "phpcs" },
		}

		lint.linters.luacheck = {
			cmd = "luacheck",
			stdin = true,
			args = {
				"--globals",
				"vim",
			},
			stream = "stdout",
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "luacheck",
			}),
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", {
			clear = true,
		})

		lint.linters.cpplint.args = {
			"--filter=-legal/copyright",
		}

		lint.linters.phpcs.args = {
			"default_standard",
			"PSR2",
		}

		table.insert(lint.linters.ruff.args, 2, "--line-length")
		table.insert(lint.linters.ruff.args, 3, "79")

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
