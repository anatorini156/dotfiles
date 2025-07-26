return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	version = "*",
	config = function()
		require("bufferline").setup {
			options = {
				offsets = {
						{
							filetype = "NvimTree",
							text="Files",
							separator= true,
							text_align = "left"
					    	}
				}
			}
		}
	end,
  }
