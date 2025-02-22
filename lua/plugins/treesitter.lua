local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "javascript", "typescript", "rust" },
    highlight = {
      enable = true,
    },
  })
end

return M
