vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative line numbers
opt.mouse = 'a'               -- Enable mouse support
opt.ignorecase = true         -- Case insensitive search
opt.smartcase = true          -- But sensitive when includes uppercase
opt.hlsearch = false          -- Don't highlight search results
opt.wrap = false              -- Don't wrap lines
opt.breakindent = true        -- Maintain indent when wrapping
opt.tabstop = 2               -- Number of spaces tabs count for
opt.shiftwidth = 2            -- Size of an indent
opt.expandtab = true          -- Use spaces instead of tabs
opt.termguicolors = true      -- True color support
opt.updatetime = 250          -- Decrease update time
opt.timeoutlen = 300          -- Time to wait for mapped sequence
opt.splitright = true         -- Put new windows right of current
opt.splitbelow = true         -- Put new windows below current
opt.scrolloff = 8             -- Lines of context
opt.sidescrolloff = 8         -- Columns of context
opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.o.swapfile = false
