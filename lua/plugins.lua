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
	use({ "neoclide/coc.nvim", branch = "release" })
	-- Code Format
	use({ "sbdchd/neoformat" })

	-- Color Scheme
	--use("arcticicestudio/nord-vim")
	use("logico/typewriter-vim")
	use("yorik1984/newpaper.nvim")
	use("chriskempson/base16-vim")
	use("shaunsingh/nord.nvim")
	use("badacadabra/vim-archery")
	use("marko-cerovac/material.nvim")

	-- Commenter
	use("preservim/nerdcommenter")
	-- Airline Status Line
	--use("vim-airline/vim-airline")
	--use("vim-airline/vim-airline-themes")
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
end)
