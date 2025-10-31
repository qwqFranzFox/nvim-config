return {
  { "Th3Whit3Wolf/onebuddy", dependencies = "tjdevries/colorbuddy.nvim" },
  { "logico/typewriter-vim" },
  { "shaunsingh/nord.nvim" },
  { "shaunsingh/solarized.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  { "xiyaowong/transparent.nvim" },
}
