return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    lazy = false,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    version = '*',
    config = function()
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
        },
      }
    end,
  },
}
