return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#9ccfd8",
			grey = "#303030",
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white },
			},
		}

		require("lualine").setup({
			options = {
				disabled_filetypes = {
					statusline = { "NvimTree" },
					winbar = { "NvimTree" },
				},
				ignore_focus = { "NvimTree" },
				theme = bubbles_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			winbar = {
				lualine_c = {
					{
						function()
							return " "
						end,
					},
					{
						function()
							return require("nvim-navic").get_location() or " "
						end,
					},
				},
			},
			inactive_winbar = {
				lualine_c = { {
					function()
						return " "
					end,
				} },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
				},
				lualine_b = {
					{ "branch", separator = { left = "", right = "" } },
					{ "diff", separator = { left = "", right = "" } },
				},
				lualine_c = {
					{
						function()
							local filepath = vim.fn.expand("%:p")
							if filepath == "" then
								return "[No Name]"
							end

							-- Try to detect project root
							local cwd = vim.fn.getcwd()
							local git_root = vim.fn.systemlist("git -C " .. cwd .. " rev-parse --show-toplevel")[1]

							local root = git_root or cwd
							if root == "" then
								root = cwd
							end

							-- Return relative path
							return vim.fn.fnamemodify(filepath, ":." .. root)
						end,
						separator = { left = "", right = "" },
						left_padding = 2,
						right_padding = 2,
					},
				},

				lualine_x = {
					function()
						local rec_reg = vim.fn.reg_recording()
						if rec_reg == "" then
							return ""
						else
							return "recording @" .. rec_reg
						end
					end,
					{
						separator = { left = "", right = "" },
						left_padding = 2,
					},
				},
				lualine_y = {
					{ "selectioncount", separator = { left = "", right = "" }, left_padding = 2 },
					{
						"filetype",
						separator = { left = "" },
						left_padding = 2,
					},
					{
						"diagnostics",
					},
					{
						"progress",
						separator = { right = "" },
						left_padding = 2,
					},
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			globalstatus = true,
			extensions = { "nvim-tree" },
		})
	end,
}
