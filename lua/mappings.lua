require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Harpoon mappings
map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<leader>1", function()
  harpoon:list():select(1)
end)
map("n", "<leader>2", function()
  harpoon:list():select(2)
end)
map("n", "<leader>3", function()
  harpoon:list():select(3)
end)
map("n", "<leader>4", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
map("n", "<C-S-N>", function()
  harpoon:list():next()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
