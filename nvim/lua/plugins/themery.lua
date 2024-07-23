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
				{ name = "Eldritch", colorscheme = "eldritch" },
				{
					name = "Modus",
					colorscheme = "modus",
					before = [[
            require("modus-themes").setup({
              variant = "default",
            })
          ]],
				},
				{
					name = "Modus Tinted",
					colorscheme = "modus",
					before = [[
            require("modus-themes").setup({
              variant = "tinted",
            })
          ]],
				},
				{ name = "Moonlight", colorscheme = "moonlight" },
				{ name = "Oh Lucy", colorscheme = "oh-lucy" },
				{ name = "One Nord", colorscheme = "onenord" },
				{ name = "Oxocarbon", colorscheme = "oxocarbon" },
				"seoul256",
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
			},
			livepreview = true,
		})
	end,
}
