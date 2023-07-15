local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	commit = "07897774c3b2f14d71b2ca51f3014d1055da9657",
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			commit = "499e0743cf5e8075cd32af68baa3946a1c76adf1",
			lazy = true,
		},
	},
}

function M.config()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier.with({
				extra_filetypes = { "toml" },
			}),
			formatting.stylua,
			diagnostics.eslint,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end,
	})
end

return M
