return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neoclip').setup()
    vim.keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "View yank history with Neoclip" })
  end,
}
