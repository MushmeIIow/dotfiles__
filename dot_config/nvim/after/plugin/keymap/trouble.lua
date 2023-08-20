local nnoremap = require('mushmellow.keymap').nnoremap


nnoremap('<leader>xx', ':TroubleToggle<CR>', { silent = true })
nnoremap('<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', { silent = true })
nnoremap('<leader>xd', ':TroubleToggle document_diagnostics<CR>', { silent = true })
nnoremap('<leader>xl', ':TroubleToggle loclist<CR>', { silent = true })
nnoremap('<leader>xq', ':TroubleToggle quickfix<CR>', { silent = true })
nnoremap('gR', ':TroubleToggle lsp_references<CR>', { silent = true })
