-- New Plugins

local plugins = require("custom.configs").plugins

for plugin_name, is_enabled in ipairs(plugins) do
  if is_enabled then
    require("custom.plugin-configs." .. plugin_name)
  end
end

return {
  -- { import = "custom.plugin-configs.lsp", enabled = true },
  -- { import = "custom.plugin-configs.cmp", enabled = true },
  -- { import = "custom.plugin-configs.conform", enabled = true },
  { import = "custom.plugin-configs.gitsigns", enabled = true },
  { import = "custom.plugin-configs.tmux_navigator", enabled = true },
  -- { import = "custom.plugin-configs.bufferlines", enabled = plugins.bufferlines },
  -- { import = "custom.plugin-configs.blankline", enabled = plugins.blankline },
  -- { import = "custom.plugin-configs.neotree", enabled = plugins.neotree },
  { import = "custom.plugin-configs.tele_project", enabled = plugins.tele_project },
  { import = "custom.plugin-configs.tele_scope", enabled = plugins.tele_scope },
  -- { import = "custom.plugin-configs.telescope", enabled = plugins.telescope },
  { import = "custom.plugin-configs.oil", enabled = plugins.oil },
  -- { import = "custom.plugin-configs.autopairs", enabled = plugins.autopairs },
  -- { import = "custom.plugin-configs.treesitter", enabled = plugins.treesitter },
  { import = "custom.plugin-configs.dressing", enabled = plugins.dressing },
  { import = "custom.plugin-configs.neoscroll", enabled = plugins.neoscroll },
  { import = "custom.plugin-configs.surround", enabled = plugins.surround },
  { import = "custom.plugin-configs.ufo", enabled = plugins.ufo },
  -- { import = "custom.plugin-configs.windline", enabled = plugins.windline },
  -- { import = "custom.plugin-configs.lualine", enabled = plugins.lualine },
  { import = "custom.plugin-configs.zenmode", enabled = plugins.zenmode },
  { import = "custom.plugin-configs.flash", enabled = plugins.flash },
  { import = "custom.plugin-configs.harpoon", enabled = plugins.harpoon },
  { import = "custom.plugin-configs.illuminate", enabled = plugins.illuminate },
  { import = "custom.plugin-configs.copilot", enabled = plugins.copilot },
  { import = "custom.plugin-configs.spectre", enabled = plugins.spectre },
  { import = "custom.plugin-configs.todo_comments", enabled = plugins.todo_comments },
  { import = "custom.plugin-configs.notify", enabled = plugins.notify },
  { import = "custom.plugin-configs.noice", enabled = plugins.noice },
  -- { import = "custom.plugin-configs.none-ls", enabled = plugins.none_ls },
  -- { import = "custom.plugin-configs.neogit", enabled = plugins.neogit },
  { import = "custom.plugin-configs.trouble", enabled = plugins.trouble },
  { import = "custom.plugin-configs.avante", enabled = plugins.avante },
  { import = "custom.plugin-configs.lazygit", enabled = plugins.lazygit }
}
