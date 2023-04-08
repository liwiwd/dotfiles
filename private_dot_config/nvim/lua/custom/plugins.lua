return {

  --   ["godlygeek/tabular"] = {},
  --   ["preservim/vim-markdown"] = {},
  {
    "TimUntersberger/neogit",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        config = function()
          local cmp = require "cmp"
          cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })

          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          })
        end,
      },
    },
    opts = function()
      return require "custom.configs.cmp"
    end,
  },
  --   {
  --     "gelguy/wilder.nvim",
  --     lazy = false,
  --     config = function()
  --       local wilder = require "wilder"
  --       wilder.setup {
  --         next_key = "<C-j>",
  --         accept_key = "<C-l>",
  --         reject_key = "<C-h>",
  --         previous_key = "<C-k>",
  --         modes = { ":", "/", "?" },
  --       }
  --       wilder.set_option(
  --         "renderer",
  --         wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
  --           pumblend = 20,
  --           border = "rounded",
  --           highlights = { border = "Normal" },
  --           highlighter = wilder.basic_highlighter(),
  --           left = { " ", wilder.popupmenu_devicons() },
  --         })
  --       )
  --     end,
  --   },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          {
            "mfussenegger/nvim-dap",
            config = function()
              require "plugins.configs.dap"
            end,
          },
        },
        config = function()
          require "plugins.configs.dap-ui"
        end,
      },
    },
    --     config = function ()
    --       require("nvim-dap-virtual-text").setup {
    --         enabled = true,
    --         enabled_commands = true,
    --         highlight_changed_variables = true,
    --         highlight_new_as_changed = false,
    --         show_stop_reason = true,
    --         commented = false,
    --         only_first_definition = true,
    --         all_references = false,
    --         display_callback = function(variable, _buf, _stackframe, _node)
    --         end,
    --
    --         virt_text_pos = 'eol',
    --         all_frames = false,
    --         virt_lines = false,
    --         virt_text_win_col = nil
    --       }
    --     end,
  },
  {
    "beauwilliams/focus.nvim",
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup {
        focus = false,
        filetype = {
          -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          go = "cd $dir && go run $fileName",
          rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          excluded_buftypes = { "message" },
        },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

      vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"
      -- vim.opt.listchars:append "eol:↴"
      return {
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "benfowler/telescope-luasnip.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
      },
    },
    opts = function()
      return require "custom.configs.telescope"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
