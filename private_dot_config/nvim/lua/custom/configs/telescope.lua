local actions = require "telescope.actions"

local opt = {
  sort_mru = true,
  sort_lastused = true,
  ignore_current_buffer = true,
  pickers = { buffers = { sort_lastused = true } },
  defaults = {
    mappings = {
        i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        },
        n = { ["q"] = actions.close },
    },
  },
  extensions = {
    ui_select = { require("telescope.themes").get_dropdown {} },
    file_browser = {
      hijack_netrw = true,
      path = "%:p:h",
      mappings = {
        ["i"] = {},
        ["n"] = {},
      },
    },
  },
  extensions_list = { "themes", "terms", "ui-select", "file_browser", "luasnip" }
}

return opt
