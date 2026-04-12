return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.comment").setup()
		require("mini.cursorword").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
		require("mini.surround").setup()
	end,
}
