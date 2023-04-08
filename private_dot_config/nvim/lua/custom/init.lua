local g = vim.g
local api = vim.api

g.mapleader = ";"

vim.wo.wrap = true
api.nvim_set_keymap("i", "<c-j>", 'pumvisible() ? "\\<c-n>" : "\\<c-j>"', { noremap = true, expr = true })
api.nvim_set_keymap("i", "<c-k>", 'pumvisible() ? "\\<c-p>" : "\\<c-j>"', { noremap = true, expr = true })

g.neovide_refresh_rate = 65
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_length = 0.00
g.neovide_cursor_vfx_mode = "railgun"
g.neovide_remember_dimensions = true
g.neovide_remember_window_size = true
-- g.neovide_transparency=0.8
-- g.neovide_cursor_vfx_particle_phase=1.5
-- g.neovide_cursor_vfx_particle_curl=1.0
-- g.neovide_profiler = true

-- vim.opt.guifont = { "JetBrains Mono NL", ":h16" }
vim.opt.guifont = { "Hack Nerd Font Mono", ":h16" }
-- vim.cmd [[ let $PATH = system("$SHELL --login -c 'echo $PATH'") ]]
vim.env.PATH = vim.fn.system "$SHELL --login -c 'echo $PATH'"

-- Rememeber last editing position.
api.nvim_create_autocmd({ "BufRead", "BufReadPost" }, {
  callback = function()
    local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
    local buf_line_count = api.nvim_buf_line_count(0)

    if row >= 1 and row <= buf_line_count then
      api.nvim_win_set_cursor(0, { row, column })
    end
  end,
})

vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets"
