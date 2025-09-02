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


vim.api.nvim_create_user_command("Wrap", function()
	vim.opt.wrap = true
end, { desc = "Enable Line Wrap" })

vim.api.nvim_create_user_command("NoWrap", function()
  vim.opt.wrap = false
end, { desc = "Disable Line Wrap" })

vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
  callback = function()
    require("lualine").refresh()
  end,
})
