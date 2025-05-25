return {
  "zaldih/themery.nvim",
  dependencies = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
    },
    "sainnhe/sonokai",
  },
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "default",
        {
          name = "Catppuccin",
          colorscheme = "catppuccin",
        },
        {
          name = "Catppuccin Frappe",
          colorscheme = "catppuccin-frappe",
        },
        {
          name = "Catppuccin Latte",
          colorscheme = "catppuccin-latte",
        },
        {
          name = "Catppuccin Macchiato",
          colorscheme = "catppuccin-macchiato",
        },
        {
          name = "Catppuccin Mocha",
          colorscheme = "catppuccin-mocha",
        },
        {
          name = "Sonokai Default",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'default' ]],
        },
        {
          name = "Sonokai Atlantis",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'atlantis' ]],
        },
        {
          name = "Sonokai Andromeda",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'andromeda' ]],
        },
        {
          name = "Sonokai Shusia",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'shusia' ]],
        },
        {
          name = "Sonokai Maia",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'maia' ]],
        },
        {
          name = "Sonokai Espresso",
          colorscheme = "sonokai",
          before = [[ vim.g.sonokai_style = 'espresso' ]],
        },
      },
      livePreview = true,
    })
  end,
}
