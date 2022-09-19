vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- map('mode','key','dest',opt)
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Open Config
map("n", "<leader>e", ":edit ~/.config/nvim<CR>", opt)
-- Plugins
map("n", "<leader>p", ":edit ~/.config/nvim/lua/plugins.lua<CR>", opt)

-- C-Y Later!
map("n", "<C-Y>", ":later<CR>", opt)
-- Format
map("n", "<leader><leader>", ":Format<CR>", opt)
-- CF Tools Test
map("n", "<leader>t", ":!cf test %<CR>", opt)
-- Compile
map("n", "<leader>r", ":!clang++ % -o %< --std=c++14 -g -Wall -Wextra<CR>", opt)

