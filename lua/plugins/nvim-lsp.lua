return {

  { "neovim/nvim-lspconfig" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("lsp.cmp")
      -- require("lsp.signs").setup()
    end,
    dependencies = "saadparwaiz1/cmp_luasnip",
  }, -- Autocompletion plugin
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      require("lsp.setup")
    end,
  },                         -- LSP source for nvim-cmp
  { "hrsh7th/cmp-buffer" },  -- { name = "buffer" },
  { "hrsh7th/cmp-path" },    -- { name = "path" }
  { "hrsh7th/cmp-cmdline" }, -- { name = "cmdline" }
  { "onsails/lspkind-nvim" },
  -- Snippets plugin
  { "rafamadriz/friendly-snippets" },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
}
