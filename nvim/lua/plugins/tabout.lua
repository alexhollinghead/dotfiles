return {
	"abecodes/tabout.nvim",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"L3MON4D3/LuaSnip",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		act_as_tab = true,
		act_as_shift_tab = true,
		completion = true,
	},
}
