-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Custom diagnostics icon

vim.diagnostic.config {
  virtual_text = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
}

-- Custom keymaps

local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc })
end

map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
-- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("<leader>co", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.organizeImports.ts" },
      diagnostics = {},
    },
  }
end, "Organize Imports")

map("<leader>rm", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  }
end, "Remove Unused Imports")

-- Pyright LSP
require "custom.lsp-servers.pyright"
