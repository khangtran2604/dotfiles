local on_attach = require("util.lsp").on_attach

return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	config = function()
		local rt = require("rust-tools")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		rt.setup({
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
	end,
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
}
--
--

-- return {
--   'mrcjkb/rustaceanvim',
--   version = '^3', -- Recommended
--   ft = { 'rust' },
--   config = function()
--     vim.g.rustaceanvim = {
--       -- Plugin configuration
--       tools = {
--         autoSetHints = true,
--         inlay_hints = {
--           show_parameter_hints = true,
--           parameter_hints_prefix = "<- ",
--           other_hints_prefix = "=> "
--         }
--       },
--       -- LSP configuration
--       --
--       -- REFERENCE:
--       -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--       -- https://rust-analyzer.github.io/manual.html#configuration
--       -- https://rust-analyzer.github.io/manual.html#features
--       --
--       -- NOTE: The configuration format is `rust-analyzer.<section>.<property>`.
--       --       <section> should be an object.
--       --       <property> should be a primitive.
--       server = {
--         on_attach = function(client, bufnr)
--           mappings(client, bufnr)
--           require("illuminate").on_attach(client)
--
--           local bufopts = {
--             noremap = true,
--             silent = true,
--             buffer = bufnr
--           }
--           vim.keymap.set('n', '<leader><leader>rr',
--             "<Cmd>RustLsp runnables<CR>", bufopts)
--           vim.keymap.set('n', 'K',
--             "<Cmd>RustLsp hover actions<CR>", bufopts)
--         end,
--         settings = {
--           -- rust-analyzer language server configuration
--           ['rust-analyzer'] = {
--             assist = {
--               importEnforceGranularity = true,
--               importPrefix = "create"
--             },
--             cargo = { allFeatures = true },
--             checkOnSave = {
--               -- default: `cargo check`
--               command = "clippy",
--               allFeatures = true
--             },
--             inlayHints = {
--               lifetimeElisionHints = {
--                 enable = true,
--                 useParameterNames = true
--               }
--             }
--           }
--         }
--       }
--     }
--   end
-- }
