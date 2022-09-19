local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "git@github.com:wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

require("packer").init({
  git = { default_url_format = "git@github.com:%s" },
})

return require("packer").startup(function()
  use({ "wbthomason/packer.nvim" })

  -- Fuzzy Finder
  use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
  -- Language Server Client
  -- lspconfig
  use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
  -- nvim-cmp
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("hrsh7th/nvim-cmp")
  -- vsnip
  use("hrsh7th/cmp-vsnip") -- { name = 'vsnip' }
  use("hrsh7th/vim-vsnip")
  use("rafamadriz/friendly-snippets")
  -- lspkind
  use("onsails/lspkind-nvim")
  -- Code Format
  use("mhartington/formatter.nvim")

  -- Color Scheme
  use("logico/typewriter-vim")
  use("yorik1984/newpaper.nvim")
  use("chriskempson/base16-vim")
  use("shaunsingh/nord.nvim")
  use("badacadabra/vim-archery")
  use("marko-cerovac/material.nvim")

  -- Airline Status Line
  use("itchyny/lightline.vim")

  -- NvimTree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- bufferline (新增)
  use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- colorizer
  use({ "norcalli/nvim-colorizer.lua" })

  -- Shortcuts linting
  use({
    "folke/which-key.nvim",
    config = function() end,
  })

  -- Commenter
  use({
    "numToStr/Comment.nvim",
    config = function() end,
  })

  -- Surround
  use("ur4ltz/surround.nvim")
end)
