local M = {
"lukas-reineke/indent-blankline.nvim",
  commit = "ceaf730b13e332cd76600d9795722413c236c684",
  event = "BufReadPre",
}

M.opts = {
  char = "▏",
  context_char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
  },
}

return M
