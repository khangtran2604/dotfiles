return {
		"tiagovla/scope.nvim",
		event = "VimEnter",
		config = function()
      require("scope").setup({ restore_state = true })
		end,
	}
