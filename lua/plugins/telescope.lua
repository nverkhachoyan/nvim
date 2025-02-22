local M = {}

function M.setup()
  local builtin = require('telescope.builtin')
  local map = vim.keymap.set
  map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
  map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
  map('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
end

return M
