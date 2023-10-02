require 'nvim-treesitter.configs'.setup {
   ensure_installed = "all",
   sync_install = false,

   ignore_install = { "phpdoc", },

   highlight = {
      enable = true,
      -- is_supported = function()
      --    if vim.fn.strwidth(vim.fn.getline('.')) > 300
      --        or vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024 then
      --       return false
      --    else
      --       return true
      --    end
      -- end,
      additional_vim_regex_highlighting = false,
      -- disable = function()
      --    return vim.b.large_buf
      -- end,
      -- disable = { "sql", "json" },
      disable = { 'lua' },
   },
   indent = { enable = true },
   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = '<c-space>',
         node_incremental = '<c-space>',
         scope_incremental = '<c-s>',
         node_decremental = '<M-space>',
      },
   },
   textobjects = {
      select = {
         enable = true,
         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
         keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
         },
      },
      move = {
         enable = true,
         set_jumps = true, -- whether to set jumps in the jumplist
         goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
         },
         goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
         },
         goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
         },
         goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
         },
      },
      swap = {
         enable = true,
         swap_next = {
            ['<leader>a'] = '@parameter.inner',
         },
         swap_previous = {
            ['<leader>A'] = '@parameter.inner',
         },
      },
   },
}
