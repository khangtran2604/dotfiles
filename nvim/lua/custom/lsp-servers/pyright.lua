local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  settings = {
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
      venvPath = ".",
      venv = "venv",
    },
  },
  root_dir = function(fname)
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
    }
    return util.root_pattern(table.unpack(root_files))(fname)
      or util.find_git_ancestor(fname)
      or util.path.dirname(fname)
  end,
}
