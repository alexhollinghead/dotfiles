return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Bamboo", colorscheme = "bamboo" },
				{ name = "Citrus Zest", colorscheme = "citruszest" },
				{ name = "Catppuccin Latte", colorscheme = "catppuccin-latte" },
				{ name = "Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
				{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },
				{
					name = "Cyberdream",
					colorscheme = "cyberdream",
					before = [[
            require("cyberdream").setup({
              theme = {variant = "default"},
              })
          ]],
				},
				{
					name = "Cyberdream Light",
					colorscheme = "cyberdream",
					before = [[
            require("cyberdream").setup({
              theme = {variant = "light"},
              })
          ]],
				},
				{ name = "Dark Flat", colorscheme = "dark_flat" },
				{ name = "DeepWhite", colorscheme = "deepwhite" },
				{ name = "Dracula", colorscheme = "dracula" },
				{ name = "Eldritch", colorscheme = "eldritch" },
				{ name = "Everforest", colorscheme = "everforest" },
				{
					name = "Everforest Light",
					colorscheme = "everforest",
					before = [[ vim.opt.background = "light" ]],
				},
				{ name = "Fluoromachine", colorscheme = "fluoromachine" },
				{
					name = "Fluoromachine Retrowave",
					colorscheme = "fluoromachine",
					before = [[ require("fluoromachine").setup({ theme = "retrowave" }) ]],
				},
				{
					name = "Fluoromachine Delta",
					colorscheme = "fluoromachine",
					before = [[ require("fluoromachine").setup({ theme = "delta" }) ]],
				},
				{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
				{ name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
				{ name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },
				{ name = "Melange", colorscheme = "melange" },
				{
					name = "Modus",
					colorscheme = "modus",
				},
				{ name = "Moonlight", colorscheme = "moonlight" },
				{
					name = "Neosolarized",
					colorscheme = "neosolarized",
					before = [[
            require("neosolarized").setup({
            background_set = true,
            })
          ]],
				},
				{ name = "Nightfox", colorscheme = "nightfox" },
				{ name = "Oh Lucy", colorscheme = "oh-lucy" },
				{ name = "One Dark", colorscheme = "onedark" },
				{ name = "One Nord", colorscheme = "onenord" },
				{ name = "Oxocarbon", colorscheme = "oxocarbon" },
				{ name = "Poimandres", colorscheme = "poimandres" },
				{ name = "seoul256", colorscheme = "seoul256" },
				{ name = "Shale", colorscheme = "shale" },
				{ name = "Solarized Osaka", colorscheme = "solarized-osaka" },
				{ name = "Sonokai", colorscheme = "sonokai" },
				{ name = "Sweetie", colorscheme = "sweetie" },
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "VSCode", colorscheme = "vscode" },
			},
			livepreview = true,
		})
	end,
}
