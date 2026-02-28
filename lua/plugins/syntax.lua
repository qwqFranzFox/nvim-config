return {
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "*",                      -- Highlight all files, but customize some others.
      css = { rgb_fn = true },  -- Enable parsing rgb(...) functions in css.
      html = { names = false }, -- Disable parsing "names" like Blue or Gray
    }
  },

  -- Shortcuts linting
  { "folke/which-key.nvim", },

  -- Auto Pairs
  { "windwp/nvim-autopairs", },

  -- Todo Highlight
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {}
  },
}
