return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			screen_width = function(min_w)
				return function()
					return vim.o.columns > min_w
				end
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = "seoul256",
			},
			tabline = { lualine_b = { "buffers" } },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local function insert_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function insert_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		insert_left({ "branch", gui = "bold" })

		insert_left({
			"diff",
			cond = conditions.screen_width(80),
		})

		insert_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
		})

		insert_left({
			function()
				return "%="
			end,
		})

		insert_right({
			"progress",
			cond = conditions.buffer_not_empty,
		})

		insert_right({
			"location",
			cond = conditions.buffer_not_empty,
		})

		insert_right({ "encoding" })

		insert_right({ "filetype" })

		require("lualine").setup(config)
	end,
}
