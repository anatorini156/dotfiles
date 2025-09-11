return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 512,
	},
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    priority = 2048,
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end,
  },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1024,
	},
}
