local M = {}

function M.setup()
  require("catppuccin").setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    color_overrides = {
      mocha = {
        base = "#202328",
        text = "#bbc2cf",
        blue = "#51afef",
        red = "#ec5f67",
        green = "#98be65",
        yellow = "#ECBE7B",
        magenta = "#c678dd",
      },
    },
  })
  vim.cmd.colorscheme "catppuccin"
end

return M
