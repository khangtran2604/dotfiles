return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "html-lsp",
      "prettier",
      "stylua",
      "typescript-language-server",
      "rust-analyzer",
    },
  },
}
