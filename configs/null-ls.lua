local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local autogroups = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,                                                    -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Python
  b.diagnostics.flake8,
  b.formatting.black.with { extra_args = { "--fast" } },

  -- Rust
  -- b.formatting.rustfmt
}

local autoformat_on_save = function(client, buffnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = autogroups,
      buffer = buffnr,
    }
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = autogroups,
      buffer = buffnr,
      callback = function()
        vim.lsp.buf.format { bufnr = buffnr }
      end,
    })
  end
end

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = autoformat_on_save,
}
