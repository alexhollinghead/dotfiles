return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		columns = {
			"icon",
			"size",
			"mtime",
		},
		delete_to_trash = true,
		watch_for_changes = true,
	},
	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
