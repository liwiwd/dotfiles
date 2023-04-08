local M = {}

M.ui = {
    theme = "tokyonight",
    lsp = {
        signature = {
            disabled = true,
            silent = true,
        },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
