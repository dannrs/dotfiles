local M = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  commit = "ef0cf1f28a22bbf2e9be531f4856d2cace57e4b2",
  dependencies = {
    {
      "MunifTanjim/nui.nvim",
      commit = "d146966a423e60699b084eeb28489fe3b6427599"
    },
    {
      "nvim-lua/plenary.nvim",
      tag = '0.1.3'
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = '0.1.2'
    },
  },
}

function M.config()
  local chatgpt = require "chatgpt"

  chatgpt.setup({
    api_key_cmd = "gpg --decrypt /home/danni/documents/secrets/openai_secret.txt.gpg"
  })
end

return M
