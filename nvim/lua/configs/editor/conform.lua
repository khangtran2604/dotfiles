-- return {
--   "stevearc/conform.nvim",
--   event = { "LspAttach", "BufReadPost", "BufNewFile" },
--   config = function()
--     require("conform").setup {
--       lsp_fallback = true,
--       formatters_by_ft = {
--         lua = { "stylua" },
--         python = { "isort", "black", stop_after_first = true },
--         javascript = { "prettierd", "prettier", stop_after_first = true },
--         typescript = { "prettierd", "prettier", stop_after_first = true },
--         json = { "prettier" },
--         yaml = { "yamlfmt" },
--         sh = { "shfmt" },
--         bash = { "shfmt" },
--         css = { "prettierd", "prettier", stop_after_first = true },
--         html = { "prettierd", "prettier", stop_after_first = true },
--         markdown = { "prettierd", "prettier", stop_after_first = true },
--         graphql = { "prettierd", "prettier", stop_after_first = true },
--         ["_"] = { "trim_whitespace" },
--       },
--       format_on_save = {
--         timeout_ms = 2500,
--         lsp_fallback = true,
--       },
--       formatters = {
--         prettier = {
--           prepend_args = { "--prose-wrap", "always" },
--         },
--         -- black = {
--         --   prepend_args = { "--line-length", "79" },
--         -- },
--       },
--     }
--
--     local map = vim.keymap.set
--     map("n", "<leader>cf", function()
--       require("conform").format { async = true, lsp_fallback = true }
--     end, { desc = "Conform - Fromat Buffer", noremap = true, silent = true })
--   end,
-- }

local function first(bufnr, ...)
  local conform = require "conform"
  for i = 1, select("#", ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>cf",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettier" },
      yaml = { "yamlfmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      python = function(bufnr)
        return { first(bufnr, "isort", "black"), "injected" }
      end,
      javascript = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
      typescript = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
      css = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
      html = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
      markdown = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
      graphql = function(bufnr)
        return { first(bufnr, "prettierd", "prettier"), "injected" }
      end,
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 2500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
