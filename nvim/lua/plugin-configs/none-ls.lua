return {
	"nvimtools/none-ls.nvim",
	event = { "BufWritePre" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local map = require("core.utils").map

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
			},
		})

		map("n", "<leader>cf", function()
			vim.lsp.buf.format({ timeout_ms = 2000 })
		end)
	end,
}
