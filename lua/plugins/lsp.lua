local M = {}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local format_on_save = require("utils.format")

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
  }
}

local defaults = {
  capabilities = capabilities,
  on_attach = format_on_save

}


function M.setup()
  for server, config in pairs(servers) do
    local server_config = vim.tbl_deep_extend("force", defaults, config)
    require("lspconfig")[server].setup(server_config)
  end
end

return M
