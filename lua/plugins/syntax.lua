return {

  { "norcalli/nvim-colorizer.lua" },

  -- Shortcuts linting
  {
    "folke/which-key.nvim",
    lazy = true,
    cmd = "WhichKey",
    config = function() end,
  },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Todo Highlight
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}
