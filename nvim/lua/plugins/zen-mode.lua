return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
	},
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 100,
				height = 1,
				options = {
					number = false,
					relativenumber = false,
					signcolumn = "no",
				},
			},
		})
	end,
}
