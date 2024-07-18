return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function(_, opts)
		require("ibl").setup({
			indent = { char = "•" },
			scope = { enabled = true },
		})
	end,
}
