
-- Options --
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.showtabline = 0
vim.opt.wrap = true

lvim.builtin.bufferline.active = false
lvim.builtin.breadcrumbs.active = false
lvim.format_on_save.enabled = false

-- Keybinding --
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.keys.normal_mode['<C-a>'] = 'gg<S-v>G'
lvim.keys.normal_mode['<S-Tab>'] = ':bp<cr>'

-- Color --
lvim.colorscheme = 'tokyonight-night'
lvim.transparent_window = true

-- Plugins --
lvim.plugins = {
  { 'folke/tokyonight.nvim' },
  { 'ThePrimeagen/harpoon' },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
}

-- Harpoon --
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<C-i>', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- Lualine --
lvim.builtin.lualine.style = 'default'
lvim.builtin.lualine.options.icons_enabled = false
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }

-- Formatting and Linting --
local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup { { command = "prettier", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } } }

linters.setup { { command = "eslint", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } } }
