vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		if vim.g.disable_autoformat then
			return
		else
			require("conform").format()
		end
	end,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.g.disable_autoformat = false
end, { desc = "Enable Auto-Format" })

vim.api.nvim_create_user_command("FormatDisable", function()
	vim.g.disable_autoformat = true
end, { desc = "Disable Auto-Format" })
