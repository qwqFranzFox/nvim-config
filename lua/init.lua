-- Interface
local set = vim.opt
local function nnoremap(key, command, props)
  vim.keymap.set("n", key, command, props)
end

-- Use Line Number
set.number = true
set.relativenumber = true
--No Mode
set.showmode = false
-- Encoding
set.encoding = "UTF-8"
-- Auto Completion Menu
set.wildmenu = true
-- Use Mouse Process
set.mouse = "a"
-- File Percents
set.ruler = true
-- Always Status Bar
set.laststatus = 2
-- Colorscheme
vim.cmd("colorscheme nord")
-- Background
set.background = "dark"
-- True Colors
set.tgc = true
-- More settings
-- Always Sign Column
set.signcolumn = "yes"

-- - Better Editing

-- Auto Highlight
vim.cmd("filetype on")
-- Paste Mode
-- set.paste
-- Show Invisible Characters
set.list = true
set.listchars = { tab = ">-", trail = "-" }
-- Use A C-Format Indent
set.autoindent = true
-- Filetype Plugin & Auto Detection
vim.cmd("filetype plugin indent on")
-- No code wrap
-- set.nowrap

-- - Searching

-- Highlight Searching Results
set.hlsearch = true
-- Search Incrementally
set.incsearch = true

-- - File Operating Configures

-- Disable Swapfile
set.swapfile = false
-- Disable Backup File
set.backup = false
-- Disable Write Backup
set.writebackup = false

-- - Pretty Code

-- Expand Tab as Space
set.expandtab = true
-- 1 Tab equals to 4 Spaces
set.shiftwidth = 2

-- Experimental Options

-- Highlight the Line where the cursor is
-- set.cursorline
-- Highlight the Column where the cursor is
-- set.cursorcolumn

-- Keybindings

-- Leader ::Key
vim.g.mapleader = " "
-- Ctrl-E will Spilt Window to Open Config File
nnoremap("<leader>e", ":edit ~/.config/nvim<cr>", { silent = true })
-- Ctrl-H will Show Help
-- nnoremap <c-h> :help
-- Ctrl-Z
nnoremap("<C-z>", ":earlier<cr>", { silent = true })
-- Ctrl-Y
nnoremap("<C-y>", ":later<cr>", { silent = true })
-- Format
nnoremap("<leader><leader>", ":Format<cr>", { silent = true })
-- Compile
nnoremap("<leader>r", ":!clang++ % -o %< --std=c++14 -g -Wall -Wextra<CR>")
-- Terminal
nnoremap("<leader>t", ":!cf test %<CR>")
nnoremap("<leader>T", ":split term://$SHELL<CR>")
-- Buffers
nnoremap("<leader>bd", ":bdelete<CR>", { silent = true })
nnoremap("<leader>bp", ":bp<CR>", { silent = true })
nnoremap("<leader>bn", ":bn<CR>", { silent = true })
nnoremap("<leader>b<Left>", " :bp<CR>", { silent = true })
nnoremap("<leader>b<Right> ", ":bn<CR>", { silent = true })

-- Plugins
require("basic")
require("plugins")
nnoremap("<leader>p", ":vsplit ~/.config/nvim/lua/plugins.lua<CR>", { silent = true })

-- Telescope.vim
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true })
nnoremap("<F4>", "<cmd>Telescope<CR>", { silent = true })

-- NvimTree
nnoremap("<leader>d", ":NvimTreeToggle<CR>", { silent = true })

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_fullscreen = true
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_hide_mouse_when_typing = true
end
-- Which-key.nvim
set.timeoutlen = 200
