local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	commit = "9e33db324b8bb7a147bce9ea5496686ee859461d",
}

function M.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[                                                          ]],
		[[.__   __.  _______   ______   ____    ____  __  .___  ___.]],
		[[|  \ |  | |   ____| /  __  \  \   \  /   / |  | |   \/   |]],
		[[|   \|  | |  |__   |  |  |  |  \   \/   /  |  | |  \  /  |]],
		[[|  . `  | |   __|  |  |  |  |   \      /   |  | |  |\/|  |]],
		[[|  |\   | |  |____ |  `--'  |    \    /    |  | |  |  |  |]],
		[[|__| \__| |_______| \______/      \__/     |__| |__|  |__|]],
		[[                                                          ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button(
			"p",
			" " .. " Find project",
			":lua require('telescope').extensions.projects.projects()<CR>"
		),
		dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
		dashboard.button("q", " " .. " Quit", ":qa<CR>"),
	}

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

			-- local now = os.date "%d-%m-%Y %H:%M:%S"
			local version = " v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
			local quote = string.rep("\t", 7) .. "danniramdhani.s"
			local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
			local footer = {
        [[]],
				version .. " " .. plugins,
				quote,
        [[]],
        [[]],
			}
			dashboard.section.footer.val = footer
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	dashboard.section.footer.val = {}

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
end

return M
