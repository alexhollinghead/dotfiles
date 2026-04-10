-- TEMPLATE: Copy this file to lua/lang/<language>.lua, fill in what you need,
-- delete unused sections, then add the module name to lang_files in lang/init.lua.

return {
	-- Optional lazy.nvim plugin specs for language-specific plugins.
	-- Common use: DAP helper plugins (e.g. nvim-dap-python, nvim-dap-go, nvim-dap-go)
	-- that wrap adapter + launch config setup into a single setup() call.
	-- Collected and surfaced to lazy.nvim by plugins/lang.lua.
	plugins = {
		-- { "author/some-lang-plugin" },
	},

	-- Treesitter parsers to install (parser name, usually matches filetype)
	treesitter = {
		-- "mylang",
	},

	-- Mason packages to auto-install
	mason = {
		lsp = { -- "mylang-lsp"
		},
		-- Formatters and linters managed by mason. Omit tools installed via
		-- brew/pip/go/etc so mason doesn't fight with system packages.
		tools = { -- "myformatter", "mylinter"
		},
	},

	-- LSP server configuration. Server name must match nvim-lspconfig's registry.
	lsp = {
		server = "mylang_ls",
		-- post_attach is called before the shared on_attach. Use it to tweak
		-- server_capabilities or do anything server-specific.
		-- post_attach = function(client, bufnr) end,
		config = {
			filetypes = { "mylang" },
			-- settings = {
			--   mylang_ls = { ... },
			-- },
		},
	},

	-- conform.nvim formatters
	formatters = {
		by_ft = {
			-- mylang = { "myformatter" },
		},
		-- Per-formatter config. Value is either a table (assigned to
		-- conform.formatters[name]) or a function(conform) for complex cases.
		config = {
			-- myformatter = { prepend_args = { "--flag" } },
			-- myformatter = function(conform)
			--   conform.formatters.myformatter = { args = { ... } }
			-- end,
		},
	},

	-- nvim-lint linters
	linters = {
		by_ft = {
			-- mylang = { "mylinter" },
		},
		-- Per-linter config. Value is either a table (assigned to lint.linters[name])
		-- or a function(lint) for args patching, parser wrapping, etc.
		config = {
			-- mylinter = { args = { "--flag" } },
			-- mylinter = function(lint)
			--   table.insert(lint.linters.mylinter.args, "--flag")
			-- end,
		},
	},

	-- nvim-dap debug adapter
	dap = {
		-- Adapter names for mason-nvim-dap to install.
		-- Valid names: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
		mason = {
			-- "debugpy", "codelldb", "delve", "js-debug-adapter", etc.
		},
		-- Called after nvim-dap is set up.
		-- If a helper plugin exists (declared in `plugins` above), prefer calling
		-- its setup() here rather than configuring adapters manually.
		-- e.g. require("dap-python").setup() or require("dap-go").setup()
		-- For manual adapter setup:
		-- setup = function(dap, _dapui)
		--   dap.adapters.mylang = {
		--     type = "executable",
		--     command = "path/to/adapter",
		--   }
		--   dap.configurations.mylang = {
		--     { type = "mylang", request = "launch", name = "Launch file", program = "${file}" },
		--   }
		-- end,
	},
}
