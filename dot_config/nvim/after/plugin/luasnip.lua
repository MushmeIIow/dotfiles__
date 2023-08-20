local luasnip = require('luasnip')

luasnip.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
})


vim.keymap.set('i', '<c-l>', function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		end
	end,
	{ silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function() luasnip.jump(-1) end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/after/plugin/snippets.lua" } })

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/after/plugin/snippets.lua <CR>', { silent = true })
