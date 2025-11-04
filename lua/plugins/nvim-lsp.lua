return {

  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", config = function()
  end }, -- Autocompletion plugin
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
  { "hrsh7th/cmp-buffer" }, -- { name = "buffer" },
  { "hrsh7th/cmp-path" }, -- { name = "path" }
  { "hrsh7th/cmp-cmdline" }, -- { name = "cmdline" }
  { "onsails/lspkind-nvim" },
  -- Snippets plugin
  { "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
}
