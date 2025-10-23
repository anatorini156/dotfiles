return {
	"pocco81/true-zen.nvim",

	config = function()
		require("true-zen").setup({
			modes = { -- configurations per mode
				ataraxis = {
					shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
					backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
					minimum_writing_area = { -- minimum size of main window
						width = 90,
						height = 44,
					},
					quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
					padding = { -- padding windows
						left = 52,
						right = 52,
						top = 0,
						bottom = 0,
					},
					callbacks = { -- run functions when opening/closing Ataraxis mode
						open_pre = nil,
						open_pos = nil,
						close_pre = nil,
						close_pos = nil,
					},
				},
				minimalist = {
					ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
					options = { -- options to be disabled when entering Minimalist mode
						number = false,
						relativenumber = false,
						showtabline = 0,
						signcolumn = "no",
						statusline = "",
						cmdheight = 1,
						laststatus = 0,
						showcmd = false,
						showmode = false,
						ruler = false,
						numberwidth = 1,
					},
					callbacks = { -- run functions when opening/closing Minimalist mode
						open_pre = function()
							vim.wo.cursorline = false
							vim.diagnostic.config({
								virtual_text = false,
								signs = true, -- gutter icons (E/W)
								underline = true, -- underline error text
								update_in_insert = false,
								severity_sort = true,
							})
							local api = require("nvim-tree.api")
							if api.tree.get_node_under_cursor() == nil then
								vim.g._restore_nv_tree = false
							else
								vim.g._restore_nv_tree = true
							end
							api.tree.close()
						end,
						open_pos = nil,
						close_pre = function()
							vim.wo.cursorline = true
							vim.diagnostic.config({
								virtual_text = true,
								signs = false, -- gutter icons (E/W)
								underline = true, -- underline error text
								update_in_insert = false,
								severity_sort = true,
							})
						end,
						close_pos = function()
							if vim.g._restore_nv_tree then
								local win_id = vim.api.nvim_get_current_win()
								require("nvim-tree.api").tree.open()
                vim.api.nvim_set_current_win(win_id)
							end
						end,
					},
				},
				narrow = {
					--- change the style of the fold lines. Set it to:
					--- `informative`: to get nice pre-baked folds
					--- `invisible`: hide them
					--- function() end: pass a custom func with your fold lines. See :h foldtext
					folds_style = "invisible",
					run_ataraxis = true, -- display narrowed text in a Ataraxis session
					callbacks = { -- run functions when opening/closing Narrow mode
						open_pre = nil,
						open_pos = nil,
						close_pre = nil,
						close_pos = nil,
					},
				},
				focus = {
					callbacks = { -- run functions when opening/closing Focus mode
						open_pre = nil,
						open_pos = nil,
						close_pre = nil,
						close_pos = nil,
					},
				},
			},
			integrations = {
				tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
				kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
					enabled = false,
					font = "+3",
				},
				twilight = false, -- enable twilight (ataraxis)
				lualine = false, -- hide nvim-lualine (ataraxis)
			},
		})

		local truezen = require("true-zen")
		local keymap = vim.keymap

		keymap.set("n", "<leader>zn", function()
			local first = 0
			local last = vim.api.nvim_buf_line_count(0)
			truezen.narrow(first, last)
		end, { noremap = true })
		keymap.set("v", "<leader>zn", function()
			local first = vim.fn.line("v")
			local last = vim.fn.line(".")
			truezen.narrow(first, last)
		end, { noremap = true })

		keymap.set("n", "<leader>zf", truezen.focus, { noremap = true,desc="Zen focus" })
		keymap.set("n", "<leader>zz", truezen.minimalist, { noremap = true, desc = "Zen Minimal" })
		keymap.set("n", "<leader>za", truezen.ataraxis, { noremap = true ,desc = "Zen ataraxis"})
	end,
}
