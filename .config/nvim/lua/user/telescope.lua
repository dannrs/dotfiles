local M = {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.2',
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    },
  },
}

local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    layout_config = {
      height = 20,
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-d>"] = actions.delete_buffer
      },
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.delete_buffer
      },
    },
  },
  pickers = {
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      path = "%:p:h",
      cwd_to_path = true,
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      hijack_netrw = true,
      layout_config = { height = 20 },
    },
  }
}

require 'telescope'.load_extension "file_browser"

return M
