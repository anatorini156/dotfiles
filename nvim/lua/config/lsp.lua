local lspconfig = require("lspconfig")

local servers = {
	"lua_ls",
	"clangd",
	"ts_ls",
	"pyright",
	"jsonls",
	"cssls",
	"html",
	"yamlls",
	"kotlin_language_server",
	"bashls",
  "cmake",
  "jdtls",
}
for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java" },
	sync_install = false,
	modules = {},
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},
})

lspconfig.zls.setup({
	on_attach = function(client, bufnr)
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
	end,
})


lspconfig.nil_ls.setup({
	--    settings = {
	--       ['nil'] = {
	--          formatting = {
	--             command = { "nixfmt" },
	--          },
	--       },
	--    },
})
