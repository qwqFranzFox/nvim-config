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
  -- Lualine Status Line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })
  -- NvimTree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- bufferline
  use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" })

  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
end)
