local M = {}

M.assistant = {
  copilot = true,
}

M.editor = {
  treesitter = true,
  telescope = true,
  git = true,
  spectre = true,
  conform = true,
}

M.motion = {
  flash = true,
  harpoon = true,
}

M.ui = {
  trouble = true,
  noice = true,
  notify = false,
  ufo = true,
}

M.utility = {
  oil = true,
  todo_comment = true,
  illuminate = true,
  tmux_navigator = true,
  scroll = true,
  indent_blankline = true,
  ts_context_commentstring = true,
  typescript_tools = false,
  nvim_surround = true,
}

return M
