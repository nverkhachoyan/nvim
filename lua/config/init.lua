require("config.options")
require("config.keymaps")

local startup = require('utils.startup')
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      startup.open_startup_screen()
    else
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        startup.open_startup_screen()
      end
    end
  end,
})
