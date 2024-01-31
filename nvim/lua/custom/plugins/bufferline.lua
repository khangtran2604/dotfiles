return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}

    local keymap = vim.keymap

    keymap.set("n", "<tab>", "<cmd>:BufferLineCycleNext<CR>", { desc = "Next Tab" })
    keymap.set("n", "<S-tab>", "<cmd>:BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
    keymap.set("n", "<leader>co", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close other tabs" })
  end
}
