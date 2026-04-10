return {
	treesitter = { "lua", "vim" },

	mason = {
		lsp = { "lua_ls" },
		tools = { "stylua", "luacheck" },
	},

	lsp = {
		server = "lua_ls",
		config = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
	},

	formatters = {
		by_ft = { lua = { "stylua" } },
		config = {
			stylua = { prepend_args = { "--column-width", "80" } },
		},
	},

	linters = {
		by_ft = { lua = { "luacheck" } },
		config = {
			-- Full custom definition: luacheck doesn't work well with default
			-- nvim-lint config; needs --globals vim and a fixed error format
			luacheck = function(lint)
				lint.linters.luacheck = {
					cmd = "luacheck",
					stdin = true,
					args = { "--globals", "vim" },
					stream = "stdout",
					ignore_exitcode = true,
					parser = require("lint.parser").from_errorformat(
						"%f:%l:%c: %m",
						{ source = "luacheck" }
					),
				}
			end,
		},
	},
}
