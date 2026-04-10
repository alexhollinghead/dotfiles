return {
	"luukvbaal/statuscol.nvim",
	event = "BufReadPost",
	config = function()
		require("statuscol").setup({
			relculright = true,
		})
	end,
}
