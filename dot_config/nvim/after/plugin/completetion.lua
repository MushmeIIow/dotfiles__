-- nvim-cmp setup
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert {
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c" }
		),
		["<M-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			{ "i", "c" }
		),

		["<c-space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(
				_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},

		-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
		-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>'] = cmp.mapping.abort(),
		-- ['<CR>'] = cmp.mapping.confirm {
		-- 	behavior = cmp.ConfirmBehavior.Replace,
		-- 	select = true,
		-- },
		-- ['<Tab>'] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { 'i', 's' }),
		-- ['<S-Tab>'] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { 'i', 's' }),
		["<tab>"] = cmp.config.disable,
		['…'] = cmp.mapping(function(fallback)
			vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](""), "n", true)
		end, { 'i', 's' }),
	},

	sources = {
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer',  keyword_length = 5 },
	},

	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
				tn = "[TabNine]",
				eruby = "[erb]",
			},
		},
	},

	experimental = {
		-- I like the new menu better! Nice work hrsh7th
		native_menu = false,

		-- Let's play with this for a day or two
		ghost_text = false,
	},
}
