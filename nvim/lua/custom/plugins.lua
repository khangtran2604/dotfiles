local plugins = {
  {
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
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "williamboman/mason.nvim",
     opts = {
        ensure_installed = {
          "lua-language-server",
          "html-lsp",
          "prettier",
          "stylua",
        "typescript-language-server"
        },
      }
  },
  -- Null-ls
  {
    "neovim/nvim-lspconfig",

     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  }
}

return plugins
