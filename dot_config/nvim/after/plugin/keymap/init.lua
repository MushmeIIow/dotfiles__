local Remap = require("mushmellow.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local vnoremap = Remap.vnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>")
nnoremap("<leader>ff", "<cmd>w<bar> <CR> <cmd>lua vim.lsp.buf.formatting_sync() <CR>")
-- inoremap("]]", "copilot#Accept()", {script = true, expr = true, silent = true})
-- inoremap("[[", "copilot#Dismiss()", {script = true, expr = true, silent = true})

nnoremap("<leader>gb", "<cmd>GitBlameToggle<CR>")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")


nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")
