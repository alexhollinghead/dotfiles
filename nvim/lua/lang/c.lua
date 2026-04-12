-- C language config.
-- LSP (clangd) and treesitter parsers are shared with cpp.lua to avoid
-- duplicate server registration. This file adds C-specific formatter and
-- linter mappings.

return {
	formatters = {
		by_ft = { c = { "clang-format" } },
		config = {},
	},

	linters = {
		by_ft = { c = { "cpplint" } },
		config = {},
	},
}
