local Remap = require("mushmellow.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>sw", function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })
end, { desc = '[S]earch by [W]ord' })
nnoremap("<C-p>", function()
	require('telescope.builtin').git_files()
end)
nnoremap("<leader>pf", function()
	require('telescope.builtin').find_files({ path_display = { "truncate" } })
end)
nnoremap("<leader>sr", function()
	require('telescope.builtin').resume()
end)

nnoremap("<leader>pi", function()
	require('telescope.builtin').current_buffer_fuzzy_find()
end)

require("telescope").load_extension "file_browser"

nnoremap("<leader>pw", "<cmd>Telescope file_browser<cr>")
nnoremap("<leader>pc", "<cmd>Telescope file_browser path=%:p:h<cr>")

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', function()
	require('telescope.builtin').find_files({ path_display = { "truncate" } })
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sF', function()
	require('telescope.builtin').find_files({ path_display = { "truncate" }, hidden = true, no_ignore = true })
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
