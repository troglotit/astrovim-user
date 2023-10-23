-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["H"] = { ":bprevious<cr>" },
    ["L"] = { ":bnext<cr>" },
    -- ["<C-u>"] = { "<C-u>zz" },
    -- ["<C-d>"] = { "<C-d>zz" },
    ["<C-j>"] = { "i<Enter><esc>k$" },
    -- [";"] = { "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>" },
    -- ["<leader>fs"] = { fuction()
    --   vim.opt
    -- end},
    ["<leader>s"] = { name = "Search and Custom" },
    ["<leader>ss"] = {
      desc = "Current buffer fuzzy find",
      function() require("telescope.builtin").current_buffer_fuzzy_find { fuzzy = false } end,
    },
    ["<leader>se"] = {
      desc = "Current buffer find",
      function() require("telescope.builtin").live_grep { search_dirs = { vim.fn.expand "%:p" } } end,
    },
    -- keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    ["<leader>sg"] = {
      desc = "Live Grep Args",
      function() require('telescope-live-grep-args.shortcuts').grep_word_under_cursor() end,
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-h>"] = { "<Left>" },
    ["<C-b>"] = { "<Left>" },
    ["<C-f>"] = { "<Right>" },
    ["<C-l>"] = { "<Right>" },
  },
  -- vim.api.nvim_set_keymap('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)
  -- v = {
  --   ["<leader>fw"] = {
  --     name = "my search",
  --     "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
  --   },
  -- },
}
