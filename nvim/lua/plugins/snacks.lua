return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dim = {},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		Snacks.toggle.dim():map("<leader>zd")
	end,
}
