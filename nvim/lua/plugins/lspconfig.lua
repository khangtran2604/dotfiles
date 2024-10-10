return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      ts_ls = {},
    },
  },
  init = function()
    require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", function()
        vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.organizeImports.ts" },
              diagnostics = {},
            },
          })
      end, { buffer = buffer, desc = "Organize Imports" })
      vim.keymap.set("n", "<leader>rm", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end, { desc = "Remove Unused", buffer = buffer })

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end)
  end,
}
