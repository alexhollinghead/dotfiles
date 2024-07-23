return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = { "oxocarbon", "seoul256", "tokyonight" },
			livepreview = true,
		})
	end,
}
