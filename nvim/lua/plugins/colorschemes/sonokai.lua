---@diagnostic disable: undefined-global
return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = 2
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_dim_inactive_windows = 1
    vim.g.sonokai_diagnostic_text_highlight = 1
    vim.g.sonokai_float_style = 'dim' -- bright, dim
    vim.g.sonokai_diagnostic_virtual_text = 'colored' -- colored, highlighted, grey
    vim.cmd.colorscheme 'sonokai'
  end,
}
