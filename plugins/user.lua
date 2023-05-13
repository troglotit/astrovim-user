return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "dmmulroy/tsc.nvim",
    event = "BufRead",
    config = function() require("tsc").setup() end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  -- { "pocco81/auto-save.nvim", lazy = false, config = function() require("auto-save").setup {} end },
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
        },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "TimUntersberger/neogit",
    lazy = false,
    config = function()
      require("neogit").setup()
      -- vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
      --     leap.leap {
      --         target_windows = target_windows,
      --         inclusive_op = false,
      --     }
      -- end)
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      local leap = require "leap"
      local target_windows = vim.tbl_filter(
        function(win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
      )
      vim.keymap.set(
        { "n", "x" },
        "<leader>j",
        function()
          leap.leap {
            target_windows = target_windows,
            inclusive_op = false,
          }
        end
      )
      -- vim.keymap.set({"n", "x", "o"}, "f", function ()
      --   local current_window = vim.fn.win_getid()
      --   require("leap").leap { target_window = { current_window } }
      -- end)
    end,
  },
}
