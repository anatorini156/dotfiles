return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		default_format_opts = {
        lsp_format = "fallback",
		},
		format_on_save = function()
			-- Disable with a global or buffer-local variable
			-- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			-- 	return
			-- end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
