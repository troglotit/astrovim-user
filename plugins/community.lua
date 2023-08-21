return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin", enable = true },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.motion.mini-surround", enable = true },
  -- { import = "astrocommunity.git.neogit", enable = true },
  { import = "astrocommunity.project.project-nvim", enable = true },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim", enable = true },
}
