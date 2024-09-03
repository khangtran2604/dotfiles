require("user.language-server-configs.ls_init")
require("user.keybindings")
require("user.autocommands")

local treesitter_ok, _ = pcall(require, "nvim-treesitter")
local lsp_ok, _ = pcall(require, "lsp-zero")
local telescope_ok, _ = pcall(require, "telescope")
local cmp_ok, _ = pcall(require, "cmp")

if treesitter_ok then
	require("user.plugin-configs.treesitter")
end

if lsp_ok then
	require("user.plugin-configs.lspconfig")
end

if telescope_ok then
	require("user.plugin-configs.telescope")
end

if cmp_ok then
	require("user.plugin-configs.cmp")
end

-- setup spellcheck
local spell_file = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local spell_words = {}
local file = io.open(spell_file, "r")
if file then
	for word in file:lines() do
		table.insert(spell_words, word)
	end
else
	print("Spell file not found:" .. spell_file)
end

if require("user.user_config").enable_plugins.catppuccin then
	vim.cmd.colorscheme("catppuccin")
end
