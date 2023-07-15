-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Disable arrow key
keymap("n", "<Up>", "<cmd>:lua print('Arrow keys disabled!')<cr>")
keymap("n", "<Left>", "<cmd>:lua print('Arrow keys disabled!')<cr>")
keymap("n", "<Right>", "<cmd>:lua print('Arrow keys disabled!')<cr>")
keymap("n", "<Down>", "<cmd>:lua print('Arrow keys disabled!')<cr>")

-- Save file(s)
keymap("n", "<C-s>", ":w<cr>")
keymap("i", "<C-s>", "<esc>:w<cr>")
keymap("v", "<C-s>", "<esc>:w<cr>")

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP')

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Telescope --
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts, { desc = "Find Files" })
keymap("n", "<leader>fb", ":Telescope file_browser<CR>", opts, { desc = "File Browser" })
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts, { desc = "Live Grep" })
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts, { desc = "List of Projects" })
keymap("n", "<leader>fa", ":Telescope buffers<CR>", opts, { desc = "List of Buffers" })

-- Lsp --
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts, { desc = "Format Document" })
