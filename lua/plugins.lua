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
  use("neovim/nvim-lspconfig")
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("hrsh7th/cmp-buffer") -- { name = "buffer" },
  use("hrsh7th/cmp-path") -- { name = "path" }
  use("hrsh7th/cmp-cmdline") -- { name = "cmdline" }
  use("onsails/lspkind-nvim")
  -- Snippets plugin
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
  use("rafamadriz/friendly-snippets")
  -- Code Format
  use("mhartington/formatter.nvim")

  -- Color Scheme
  use("jim-at-jibba/ariake-vim-colors")
  use("sainnhe/edge")
  use({ "Th3Whit3Wolf/onebuddy", requires = "tjdevries/colorbuddy.nvim" })
  use("logico/typewriter-vim")
  use("yorik1984/newpaper.nvim")
  use("shaunsingh/nord.nvim")
  use("marko-cerovac/material.nvim")
  use("Th3Whit3Wolf/one-nvim")
  use("shaunsingh/solarized.nvim")
  use("Mofiqul/dracula.nvim")

  -- Airline Status Line
  -- use("itchyny/lightline.vim")
  -- use("daviesjamie/vim-base16-lightline")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  -- NvimTree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
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
  })

  -- Comment
  use("numToStr/Comment.nvim")

  -- Auto Pairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- Todo Highlight
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Rust
  use("simrat39/rust-tools.nvim")

  -- Debugging
  use({
    "mfussenegger/nvim-dap",
    requires = { "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  })
end)
