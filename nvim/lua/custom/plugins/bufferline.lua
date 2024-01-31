return {
  'akinsho/bufferline.nvim',
  version = "v3.*",
  dependencies = { 'nvim-tree/nvim-web-devicons', 'famiu/bufdelete.nvim' },
  config = function()
    vim.opt.termguicolors = true

    local keymap = vim.keymap

    keymap.set("n", "<tab>", "<cmd>:BufferLineCycleNext<CR>", { desc = "Next Tab" })
    keymap.set("n", "<S-tab>", "<cmd>:BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
    keymap.set("n", "<leader>co", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close other tabs" })
    keymap.set("n", "<leader>x", function()
      require('bufdelete').bufdelete(0, true)
    end, { desc = "Close current tab" })

    require("bufferline").setup({})
  end
}
