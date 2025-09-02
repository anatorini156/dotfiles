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
				lualine_c = {
					{
						function()
							return " "
						end,
					},
				},
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", { "branch", separator = { left = "|" } } },
				lualine_c = {},
				lualine_x = {
					function()
						local rec_reg = vim.fn.reg_recording()
						if rec_reg == "" then
							return ""
						else
							return "recording @" .. rec_reg
						end
					end,
				},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
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
