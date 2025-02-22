local map = vim.keymap.set

map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })
map('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- diagnostic
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- Trouble keymaps
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = 'Toggle diagnostics window' })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { desc = 'Toggle workspace diagnostics' })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = 'Toggle document diagnostics' })
