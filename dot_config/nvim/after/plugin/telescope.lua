local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    file_ignore_patterns = { "node_modules", "^.git/" },
    path_display={"smart"},
  },
  pickers = {
      find_files = {
          hidden = true
      }
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
