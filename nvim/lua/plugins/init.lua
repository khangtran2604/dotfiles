local s = require "settings"

return {
  { import = "configs.lsp.init" },
  { import = "configs.cmp" },

  --------------------------------- Assistant ---------------------------------
  { import = "configs.assistant.copilot", enabled = s.assistant.copilot },

  --------------------------------- Editor ---------------------------------
  { import = "configs.editor.treesitter", enabled = s.editor.treesitter },
  { import = "configs.editor.telescope", enabled = s.editor.telescope },
  { import = "configs.editor.git", enabled = s.editor.git },
  { import = "configs.editor.spectre", enabled = s.editor.spectre },
  { import = "configs.editor.conform", enabled = s.editor.conform },

  --------------------------------- Motion ---------------------------------
  { import = "configs.motion.flash", enabled = s.motion.flash },
  { import = "configs.motion.harpoon", enabled = s.motion.harpoon },

  --------------------------------- UI ---------------------------------
  { import = "configs.ui.trouble", enabled = s.ui.trouble },
  { import = "configs.ui.noice", enabled = s.ui.noice },
  { import = "configs.ui.ufo", enabled = s.ui.ufo },

  --------------------------------- Utility ---------------------------------
  { import = "configs.utility.oil", enabled = s.utility.oil },
  { import = "configs.utility.todo-comment", enabled = s.utility.todo_comment },
  { import = "configs.utility.illuminate", enabled = s.utility.illuminate },
  { import = "configs.utility.tmux-navigator", enabled = s.utility.tmux_navigator },
  { import = "configs.utility.scroll", enabled = s.utility.scroll },
  { import = "configs.utility.indent-blankline", enabled = s.utility.indent_blankline },
  { import = "configs.utility.ts-context-commentstring", enabled = s.utility.ts_context_commentstring },
  { import = "configs.utility.typescript-tools", enabled = s.utility.typescript_tools },
  { import = "configs.utility.nvim-surround", enabled = s.utility.nvim_surround },
}
