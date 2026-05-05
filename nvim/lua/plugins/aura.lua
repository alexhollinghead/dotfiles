return {
	"baliestri/aura-theme",
	lazy = true,
	config = function(plugin)
		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	end,
}
