local M = {
  "windwp/nvim-autopairs",
  commit = "59df87a84c80a357ca8d8fe86e451b93ac476ccc",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      commit = "fc0f694af1a742ada77e5b1c91ff405c746f4a26",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-autopairs").setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M
