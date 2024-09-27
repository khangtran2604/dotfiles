return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  config = function()
    require("project_nvim").setup()
  end,
}
