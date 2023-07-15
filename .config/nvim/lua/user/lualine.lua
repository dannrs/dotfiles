local M = {
  "nvim-lualine/lualine.nvim",
  commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    always_visible = true,
  }

  local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width,
  }

  local filetype = {
    "filetype",
    icons_enable = false,
  }

  local location = {
    "location",
    padding = 1,
  }

  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = false,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", diff, diagnostics },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", filetype },
      lualine_y = { "progress" },
      lualine_z = { location },
    },
  }
end

return M
