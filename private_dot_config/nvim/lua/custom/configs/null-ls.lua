local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
-- Formatter
  -- yml
  b.formatting.yq,
  -- xml
  b.formatting.xmlformat,
  -- web
  b.formatting.tidy,
  --b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.completion.luasnip,
  b.formatting.stylua,

  -- Go
  b.formatting.gofmt,

  -- C
  b.formatting.clang_format,

  -- Rust
  b.formatting.rustfmt,

  -- Shell
  b.formatting.shfmt,
  
  
  
-- Linter
--   b.diagnostics.golangci_lint,
  b.diagnostics.shellcheck.with ({
    diagnostics_format = "#{m} [#{c}]",
  }),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
