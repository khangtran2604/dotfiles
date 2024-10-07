require "custom.chadrc"
require "custom.options"
require "custom.autocmds"

-- Override Plugins
local override_plugins = { "telescope", "cmp", "treesitter" }

for _, plugin_path in ipairs(override_plugins) do
  require("custom.plugin-configs." .. plugin_path)
end
