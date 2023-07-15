local M = {
  "folke/which-key.nvim",
  commit = "e271c28118998c93a14d189af3395812a1aa646c",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.setup {
    show_help = false,
    plugins = {
      presets = {
        operators = false,
      },
    },
  }

  wk.register({
    f = {
      name = "Telescope",
      a = { "List of Buffers" },
      b = { "File Browser" },
      f = { "Find Files" },
      p = { "Projects" },
      t = { "Live Grep" },
    },
    l = {
      name = "LSP",
      f = { "Format Document"},
    },
  }, { prefix = "<leader>" })
end

return M
