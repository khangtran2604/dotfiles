return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- defaults
      "vim",
      "lua",

      -- web dev
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      -- "vue", "svelte",
    },
  },
}
