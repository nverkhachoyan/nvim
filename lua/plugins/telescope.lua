local M = {}
function M.setup()
  local builtin = require('telescope.builtin')
  local map = vim.keymap.set
  map('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
  map('n', '<leader>g', builtin.live_grep, { desc = 'Live grep' })
  map('n', '<leader>b', builtin.buffers, { desc = 'Find buffers' })
end

return M
