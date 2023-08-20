-- vim.g.theprimeagen_colorscheme = "tokyonight"
--
-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.g.gruvbox_invert_selection = '0'
-- vim.opt.background = "dark"
--
-- vim.cmd("colorscheme tokyonight")

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    transparent_background = true,
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			styles = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic"
			}
		},
		lsp_trouble = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = false,
		markdown = true,
		lightspeed = false,
		ts_rainbow = false,
		hop = false
	}
})

vim.cmd("colorscheme catppuccin")
