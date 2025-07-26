return {
	"mason-org/mason.nvim",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	},
	config =
	    function()
		    require("mason").setup()
		    vim.lsp.config['luals'] = {
			    cmd = { "lua-language-server" },
			    filetypes = { 'lua' },
			    settings = {
				    Lua = {
					    runtime = {
						    version = "LuaJit"
					    }
				    }
			    }

		    }
		    -- vim.lsp.enable("luals")
		    -- vim.lsp.enable("clangd")
	    end
}
