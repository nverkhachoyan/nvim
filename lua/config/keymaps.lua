local map = vim.keymap.set

-- Basic operations
map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
map('n', '<leader>wa', '<cmd>wall<cr>', { desc = 'Save all' })
map('n', '<leader>qq', '<cmd>quit<cr>', { desc = 'Quit' })
map('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Text manipulation
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
map('v', '>', '>gv', { desc = 'Indent and maintain selection' })
map('v', '<', '<gv', { desc = 'De-indent and maintain selection' })
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- Search and replace
map('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
  { desc = 'Search and replace current word' })

-- Quality of life
map('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode with Ctrl-c' })
map('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })

-- Line number toggle
local function toggle_relative_number()
  vim.wo.relativenumber = not vim.wo.relativenumber
end
map('n', '<leader>tn', toggle_relative_number, { desc = 'Toggle relative numbers' })

-- Diagnostics
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle diagnostics window' })
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>',
  { desc = 'Toggle workspace diagnostics' })
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',
  { desc = 'Toggle document diagnostics' })

-- Buffer management
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close current buffer' })

-- Quick navigation (quotes and brackets)
map('n', "c'", ":keeppatterns /'<CR>0ci'", { silent = true })
map('n', 'c"', ':keeppatterns /"<CR>0ci"', { silent = true })
map('n', 'c`', ':keeppatterns /`<CR>0ci`', { silent = true })
map('n', 'c(', ':keeppatterns /(<CR>0ci(', { silent = true })
map('n', 'c[', ':keeppatterns /[<CR>0ci[', { silent = true })
map('n', 'c{', ':keeppatterns /{<CR>0ci{', { silent = true })
map('n', 'c}', ':keeppatterns /}<CR>0ci}', { silent = true })
map('n', 'c]', ':keeppatterns /]<CR>0ci]', { silent = true })
map('n', 'c)', ':keeppatterns /)<CR>0ci)', { silent = true })
