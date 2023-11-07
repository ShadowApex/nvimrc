-- Dracula theme
return {
  -- Add dracula theme
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
