local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer", "emmet_ls", "tsserver", "jedi_language_server" }

-- Create capabilities for clangd to use utf-16 encoding
local clang_capabilities = vim.tbl_extend("keep", capabilities, {
  offsetEncoding = "utf-16",
})

lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = clang_capabilities,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
