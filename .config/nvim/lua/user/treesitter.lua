local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
      commit = "2a125024a137677930efcfdf720f205504c97268"
    },
    {
      "windwp/nvim-ts-autotag",
      commit = "40615e96075c743ef47aaf9de966dc348bec6459",
      event = "InsertEnter",
    },
  },
}

function M.config()
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "javascript",
      "tsx",
      "typescript",
      "toml",
      "fish",
      "json",
      "yaml",
      "css",
      "html",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      disable = {},
    },
    autopairs = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {},
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
