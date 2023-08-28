-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--
-- local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- local is_bootstrap = false
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   is_bootstrap = true
--   vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--   vim.cmd [[packadd packer.nvim]]
-- end

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Packer can manage itself
  'wbthomason/packer.nvim',
  --use 'sbdchd/neoformat'
  --use 'nanotee/sqls.nvim'

  'github/copilot.vim',
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  'nvim-telescope/telescope-file-browser.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {
          -- Adds a number of user-friendly snippets
          'rafamadriz/friendly-snippets',
        },

        {
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lua',
          'hrsh7th/cmp-nvim-lsp',
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- cool formating
      'onsails/lspkind.nvim'
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs                        = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      watch_gitdir                 = {
        follow_files = true
      },
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false,
      on_attach                    = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,   -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm                         = {
        enable = false
      },
    },
  },
  -- { -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  --   transparent = true,
  -- },

  {
    'catppuccin/nvim',
    as = 'catppuccin'
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'folke/noice.nvim',
    config = function()
      require('noice').setup({
        -- add any options here
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    }
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },

  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- debugging
  'mfussenegger/nvim-dap',
  'leoluz/nvim-dap-go',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',

  {
    'folke/trouble.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  'nvim-treesitter/nvim-treesitter-context',


  {
    'akinsho/toggleterm.nvim', version = "*", config = true
  },
  --
  --     use 'f-person/git-blame.nvim'
  --
  --     use 'hashicorp/terraform-ls'
  --
  --     use 'ray-x/go.nvim'
  --     use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  --
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
  },

  { "NeogitOrg/neogit",      dependencies = "nvim-lua/plenary.nvim", config = true },

  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "nvim -l build/init.lua",
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'mbbill/undotree',
  },
  --     -- Simple plugins can be specified as strings
  --     use("TimUntersberger/neogit")
  --
  --     use {
  --         'numToStr/Comment.nvim',
  --         config = function()
  --             require('Comment').setup()
  --         end
  --     }
  --     -- Terminal
  --     use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  --         require("toggleterm").setup()
  --     end}
  --
  --     -- All things
  --     use("hrsh7th/cmp-buffer")
  --     use 'hrsh7th/cmp-path'
  --     use 'hrsh7th/cmp-nvim-lsp-signature-help'
  --     use 'rafamadriz/friendly-snippets'
  --
  --   -- Colorscheme
  --   use { "catppuccin/nvim", as = "catppuccin" }
  --
  --     use { -- Highlight, edit, and navigate code
  --     'nvim-treesitter/nvim-treesitter',
  --     run = function()
  --         pcall(require('nvim-treesitter.install').update { with_sync = true })
  --     end,
  --     }
  --
  --     use { -- Additional text objects via treesitter
  --     'nvim-treesitter/nvim-treesitter-textobjects',
  --     after = 'nvim-treesitter',
  --     }
  --
  --     use 'nvim-treesitter/nvim-treesitter-context'
  --
  --     -- debugging
  --     use 'mfussenegger/nvim-dap'
  --     use 'leoluz/nvim-dap-go'
  --     use 'rcarriga/nvim-dap-ui'
  --     use 'theHamsta/nvim-dap-virtual-text'
  --     use 'nvim-telescope/telescope-dap.nvim'
  --
  --     -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  --     local has_plugins, plugins = pcall(require, 'custom.plugins')
  --     if has_plugins then
  --       plugins(use)
  --     end
  --
  --     if is_bootstrap then
  --       require('packer').sync()
  --     end
  --
  -- end)
  --
  -- When we are bootstrapping a configuration, it doesn't
  -- make sense to execute the rest of the init.lua.
  --
  -- You'll need to restart nvim, and then it will work.
  -- { import = 'custom.plugins' },

  require 'mushmellow.plugins.autoformat',
}, {})
-- if is_bootstrap then
--   print '=================================='
--   print '    Plugins are being installed'
--   print '    Wait until Packer completes,'
--   print '       then restart nvim'
--   print '=================================='
--   return
-- end
--
-- -- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })
-- -- vim: ts=2 sts=2 sw=2 et
