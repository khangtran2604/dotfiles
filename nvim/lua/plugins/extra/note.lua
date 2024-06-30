return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    lazy = false,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim', { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' } },
    version = '*',
    event = 'VeryLazy',
    config = function()
      local neorg_callbacks = require 'neorg.core.callbacks'

      neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode('norg', {
          n = { -- Bind keys in normal mode
            { '<leader>nf', 'core.integrations.telescope.find_linkable' },
            { '<leader>nw', 'core.integrations.telescope.switch_workspace' },
            { '<leader>nn', 'core.dirman.new.note' },
          },

          i = { -- Bind in insert mode
            { '<C-i>', 'core.integrations.telescope.insert_link' },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)

      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icons = {
                todo = {
                  pending = {
                    icon = require('configs.icons').neorg.task.pending,
                  },
                  urgent = {
                    icon = require('configs.icons').neorg.task.urgent,
                  },
                },
              },
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
          -- Telescope
          ['core.integrations.telescope'] = {},
        },
      }
    end,
  },
}
