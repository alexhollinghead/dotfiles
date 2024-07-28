return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Bamboo", colorscheme = "bamboo" },
				{
					name = "Cyberdream",
					colorscheme = "cyberdream",
					before = [[
            require("cyberdream").setup({
              theme = {variant = "default"},
              })
          ]],
				},
				{ name = "Citrus Zest", colorscheme = "citruszest" },
				{
					name = "Cyberdream Light",
					colorscheme = "cyberdream",
					before = [[
            require("cyberdream").setup({
              theme = {variant = "light"},
              })
          ]],
				},
				{ name = "DeepWhite", colorscheme = "deepwhite" },
				{ name = "Dracula", colorscheme = "dracula" },
				{ name = "Eldritch", colorscheme = "eldritch" },
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
				{ name = "Oh Lucy", colorscheme = "oh-lucy" },
				{ name = "One Nord", colorscheme = "onenord" },
				{ name = "Oxocarbon", colorscheme = "oxocarbon" },
				"seoul256",
				{ name = "Poimandres", colorscheme = "poimandres" },
				{ name = "Sweetie", colorscheme = "sweetie" },
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "VSCode", colorscheme = "vscode" },
			},
			livepreview = true,
		})
	end,
}
