local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

-- Install Mason
--  eslint-lsp
--  lua-language-server
--  prettier
--  stylua
--  tyypescript-langulage-server
local sources = {
  b.formatting.stylua,
  b.formatting.prettier,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.formatting_sync()
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
