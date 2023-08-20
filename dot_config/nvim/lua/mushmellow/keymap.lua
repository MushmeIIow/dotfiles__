local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")

-- local keymap = function(tbl)
-- 	-- Some sane default options
-- 	local opts = { noremap = true, silent = true }
-- 	-- Dont want these named fields on the options table
-- 	local mode = tbl['mode']
-- 	tbl['mode'] = nil
-- 	local bufnr = tbl['bufnr']
-- 	tbl['bufnr'] = nil
--
-- 	for k, v in pairs(tbl) do
-- 		if tonumber(k) == nil then
-- 			opts[k] = v
-- 		end
-- 	end
--
--
-- 	if bufnr ~= nil then
-- 		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
-- 	else
-- 		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
-- 	end
-- end
--
-- M.nmap = function(tbl)
-- 	tbl['mode'] = 'n'
-- 	keymap(tbl)
-- end
--
-- M.imap = function(tbl)
-- 	tbl['mode'] = 'i'
-- 	keymap(tbl)
-- end

return M
