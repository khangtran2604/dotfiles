---@diagnostic disable: undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- { import = "plugins.colorschemes.tokyonight" },
	{ import = "plugins.colorschemes.sonokai" },
	{ import = "plugins.ui" },
	{ import = "plugins.code" },
	{ import = "plugins.navigate" },
	{ import = "plugins.assistants" },
	{ import = "plugins.extra" },
}, {
	change_detection = {
		notify = false,
	},
})

-- require("plugins.configs.cmp")
