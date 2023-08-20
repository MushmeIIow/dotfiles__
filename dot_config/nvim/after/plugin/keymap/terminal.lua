local Remap = require("mushmellow.keymap")
local tnoremap = Remap.tnoremap
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap


nnoremap("<C-q>", ":ToggleTerm<CR>")
inoremap("<C-q>", "<Esc>:ToggleTerm<CR>")
tnoremap("<C-q>", "<c-\\><c-n>:ToggleTerm<CR>")
