return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"folke/trouble.nvim",
	},
	config = function()
		require("todo-comments").setup()
		vim.keymap.set(
			"n",
			"<leader>xt",
			"<cmd>Trouble todo<cr>",
			{ desc = "Find todos in Trouble" }
		)
		vim.keymap.set(
			"n",
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			{ desc = "Find todos" }
		)
		vim.keymap.set(
			"n",
			"<leader>qt",
			"<cmd>TodoQuickFix<cr>",
			{ desc = "Show todos in quickfix list" }
		)
	end,
}
