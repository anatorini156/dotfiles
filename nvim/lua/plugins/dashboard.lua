return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
	    theme = "doom",
	    config = {
		    header = {
			    "",
			    "",
			    "",
			    "",
			    "",
			    "",
			    "",
			  "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			  "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			  "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			  "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			  "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			  "",
			  "                    NeoVim                      ",
		  },
center = {
          { desc = "󰍉 Find File", group = "@property", action = "Telescope find_files", key = "f" },
          { desc = " Find Word", group = "Label", action = "Telescope live_grep", key = "w" },
          { desc = " Recent", group = "Number", action = "Telescope oldfiles", key = "r" },
          { desc = " Quit", group = "DiagnosticError", action = "qa", key = "q" },
        },
	    },
    
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
