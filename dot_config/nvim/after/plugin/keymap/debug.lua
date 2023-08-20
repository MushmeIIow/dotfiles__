local nnoremap = require('mushmellow.keymap').nnoremap

nnoremap('<F5>', '<cmd>lua require("dap").continue()<CR>')
nnoremap('<F10>', '<cmd>lua require("dap").step_over()<CR>')
nnoremap('<F11>', '<cmd>lua require("dap").step_into()<CR>')
nnoremap('<F12>', '<cmd>lua require("dap").step_out()<CR>')

nnoremap('<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
nnoremap('<leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
nnoremap('<leader>lp', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
nnoremap('<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')

nnoremap('<leader>td', '<cmd>lua require("dap-go").debug_test()<CR>', {silent = true})
