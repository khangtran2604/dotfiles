return {
	"phaazon/hop.nvim",
	branch = "v2", -- optional but strongly recommended
	-- event = "BufEnter",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>j",
			"<CMD>HopChar2<CR>",
			desc = "Jump to anywhere by 2 characters",
		},
	},
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
