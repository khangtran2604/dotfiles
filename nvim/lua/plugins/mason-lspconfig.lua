local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		-- "rust_analyzer",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
