return {
  "stevearc/conform.nvim",
  event = "BufRead",
  config = function()
    require("conform").setup {
      lsp_fallback = true,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black", stop_after_first = true },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "prettier" },
        yaml = { "yamlfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        css = { { "prettierd", "prettier", stop_after_first = true } },
        html = { { "prettierd", "prettier", stop_after_first = true } },
        markdown = { { "prettierd", "prettier", stop_after_first = true } },
        graphql = { { "prettierd", "prettier", stop_after_first = true } },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    local map = vim.keymap.set
    map("n", "<leader>cf", function()
      require("conform").format { async = true, lsp_fallback = true }
    end, { desc = "Conform - Fromat Buffer", noremap = true, silent = true })
  end,
}
