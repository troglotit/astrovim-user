return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "dmmulroy/tsc.nvim",
    event = "BufRead",
    config = function() require("tsc").setup() end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = function() require("gruvbox").setup {} end },
  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "*",
  --   event = "BufRead",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     vim.opt.termguicolors = true
  --     require("bufferline").setup()
  --   end,
  -- },
  {
    "edgedb/edgedb-vim",
    event = "BufRead",
    -- config = function() require("tsc").setup() end,
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
  -- {
  --   "TimUntersberger/neogit",
  --   lazy = false,
  --   config = function()
  --     require("neogit").setup()
  --   end,
  -- },
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
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "User AstroGitFile",
    keys = {
      { "<leader>gn", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
    },
    config = function()
      require("neogit").setup {
        mappings = {
          -- status = {
          -- },
          popup = {
            ["O"] = "ResetPopup",
            ["F"] = "PullPopup",
            ["p"] = "PushPopup",
          },
        },
      }
    end,
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
    dependencies = {
      "hrsh7th/cmp-cmdline", -- add cmp-cmdline as dependency of cmp
    },
    config = function(plugin, opts)
      local cmp = require "cmp"
      -- run cmp setup
      cmp.setup(opts)

      -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
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
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require "elixir"
      local elixirls = require "elixir.elixirls"

      elixir.setup {
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = false,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "julienvincent/nvim-paredit",
    config = function() require("nvim-paredit").setup() end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function() require("treesitter-context").setup() end,
  },
}
