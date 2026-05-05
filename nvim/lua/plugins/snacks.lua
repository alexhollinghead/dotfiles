return {
	"folke/snacks.nvim",
	priority = 1000,
	keys = {
		{ "<leader>zd", function() Snacks.toggle.dim():toggle() end, desc = "Toggle dim" },
	},
	opts = {
		dim = {},
	},
}
