require("nvim-treesitter.configs").setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	ensure_installed = {
		"html",
		"css",
		"vim",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"bash",
		"rust",
		"make",
		"cmake",
		"python",
		"cpp",
		"c",
		"html",
	},
	-- 启用代码高亮功能
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	-- 启用增量选择
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
	indent = {
		enable = true,
	},
})
