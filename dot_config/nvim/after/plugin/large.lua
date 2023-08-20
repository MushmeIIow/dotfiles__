local aug = vim.api.nvim_create_augroup("Mushmellow", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
	callback = function()
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
		if ok and stats and (stats.size > 900000) then
			vim.b.large_buf = true
			vim.cmd("syntax off")
			-- vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
			vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
			vim.cmd("Gitsigns toggle_signs")
		else
			vim.b.large_buf = false
		end
	end,
	group = aug,
	pattern = "*",
})
