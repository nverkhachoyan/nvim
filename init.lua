-- getting path to lazy install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if file doesn't exist, git clone to lazypath
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- prepending lazy to nvim's run time path
vim.opt.rtp:prepend(lazypath)

-- base configs
require("config")

-- init lazy with my plugins
require("lazy").setup(require("plugins"))
