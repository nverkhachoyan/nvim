local M = {}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls" },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local format_on_save = require("utils.format")

local key_maps = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set
  local lsp_buf = vim.lsp.buf
  map('n', 'gd', lsp_buf.definition, opts)
  map('n', 'gr', lsp_buf.references, opts)
  map('n', 'gi', lsp_buf.implementation, opts)
  map('n', 'K', lsp_buf.hover, opts)
end

local servers = {
  lua_ls = {},
  ts_ls = {},
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  gopls = {}
}

local defaults = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    format_on_save(client, bufnr)
    key_maps(client, bufnr)
  end
}


function M.setup()
  for server, config in pairs(servers) do
    local server_config = vim.tbl_deep_extend("force", defaults, config)
    require("lspconfig")[server].setup(server_config)
  end
end

return M
