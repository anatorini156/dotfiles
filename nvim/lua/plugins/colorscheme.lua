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
	},
	{
		"catppuccin/nvim",
		name = "catppuccin-frappe",
		priority = 256,
		-- config = function()
		-- 	vim.cmd("colorscheme catppuccin-frappe")
		-- end,
	},
	{
		"nkxxll/ghostty-default-style-dark.nvim",
		lazy = false,
		priority = 128,
		config = function()
			require("ghostty-default-style-dark").setup({})
			vim.cmd.colorscheme("ghostty-default-style-dark")
		end,
	},
}
