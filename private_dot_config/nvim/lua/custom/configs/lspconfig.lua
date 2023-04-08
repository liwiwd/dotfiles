local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- Imports orgnized for go
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

-- LSP diagnostics tweaks
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)


-- if you just want default config for the servers then put them in a table
local servers = {
"gopls",
"rust_analyzer",
"clangd"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
--[[
-- individual config
local util = require("lspconfig/util")
lspconfig.gopls.setup ({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
      return util.root_pattern('go.work', 'go.mod', '.git')(fname)
    end,
  single_file_support = true,
  settings = {
    ["gopls"] = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lspconfig.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
        imports = {
            granularity = {
                group = "module",
            },
            prefix = "self",
        },
        cargo = {
            buildScripts = {
                enable = true,
            },
        },
        procMacro = {
            enable = true
        },
    }
  }
})
]]
