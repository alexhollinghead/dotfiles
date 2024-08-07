-- Highlight, edit, and navigate code
return {
	{
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-context",
		build = function()
			pcall(
				require("nvim-treesitter.install").update({ with_sync = true })
			)
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				lazy = false,
				auto_install = true,

				ensure_installed = {
					"c",
					"cpp",
					"html",
					"lua",
					"markdown",
					"python",
					"javascript",
					"json",
					"typescript",
					"tsx",
					"vim",
				},

				-- Endwise - end structures automatically
				endwise = { enable = true },

				highlight = { enable = true },
				indent = { enable = true, disable = {} },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar
						--to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
				require("nvim-ts-autotag").setup({
					lazy = false,
					enable = true,
					filetypes = { "html", "xml", "tsx", "typescriptreact" },
				}),
				require("treesitter-context").setup(),
			})
		end,
	},
}
