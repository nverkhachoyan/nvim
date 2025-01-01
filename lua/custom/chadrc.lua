---@class ChadrcConfig
local M = {}

M.plugins = {
   -- Ensure mason.nvim and mason-lspconfig.nvim are installed
   { "williamboman/mason.nvim" },
   { "williamboman/mason-lspconfig.nvim" },
}

M.mason = {
   ensure_installed = { "gopls" }, -- Ensure gopls is installed
}

M.lspconfig = {
   setup_lsp = function(server_name, opts)
      require("lspconfig")[server_name].setup(opts)
   end,

   -- Customize LSP settings for gopls
   servers = {
      gopls = {
         on_attach = function(client, _)
            -- Enable auto-format on save
            if client.server_capabilities.documentFormattingProvider then
               vim.api.nvim_command [[augroup Format]]
               vim.api.nvim_command [[autocmd! * <buffer>]]
               vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
               vim.api.nvim_command [[augroup END]]
            end
         end,
      },
   },
}

return M

