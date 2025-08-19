return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1024,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 2000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
	},
}
