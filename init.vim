" - Interface

" Language
language zh_CN.UTF-8
" Use Line Number
set number
set relativenumber
" No Mode
set noshowmode
" Encoding
set encoding=UTF-8
" Auto Completion Menu
set wildmenu
" Use Mouse Process
set mouse=a
" File Percents
set ruler
" Always Status Bar
set laststatus=2
" Colorscheme
colorscheme onebuddy
" Background
set background=dark
" True Colors
set tgc
" More settings
" Always Sign Column
set signcolumn=yes

" - Better Editing

" Enable ctags
if (!has("win32"))
  set tags=./tags;,tags
endif
" Auto Highlight
filetype on
" Paste Mode
" set paste
" Show Invisible Characters
set list
set listchars=tab:>-,trail:-
" Use A C-Format Indent
set autoindent
" Filetype Plugin & Auto Detection
filetype plugin indent on
" No code wrap
" set nowrap

" - Searching

" Highlight Searching Results
set hlsearch
" Search Incrementally
set incsearch

" - File Operating Configures

" Disable Swapfile
set noswapfile
" Disable Backup File
set nobackup
" Disable Write Backup
set nowritebackup

" - Pretty Code

" Expand Tab as Space
set expandtab
" 1 Tab equals to 4 Spaces
set shiftwidth=2

" Experimental Options

" Highlight the Line where the cursor is
" set cursorline
" Highlight the Column where the cursor is
" set cursorcolumn

" Keybindings

" Leader Key
let mapleader = "\ "
" Ctrl-E will Spilt Window to Open Config File
if has("win32")
  " On Windows
  nnoremap <silent><leader>e :edit C:\Users\AFGXF\AppData\Local\nvim<cr>
else
  " On Unix
  nnoremap <silent><leader>e :edit ~/.config/nvim<cr>
endif
" Ctrl-H will Show Help
" nnoremap <c-h> :help
" Ctrl-Z
"noremap <silent><C-z> :earlier<cr>
" Ctrl-Y
noremap <silent><C-y> :later<cr>
" Format
nnoremap <silent><leader><leader> :Format<cr>
" Compile
nnoremap <leader>r :!clang++ % -o %< --std=c++14 -g -Wall -Wextra<CR>
" Terminal
nnoremap <leader>t :!cf test %<CR>
nnoremap <leader>T :split term://$SHELL<CR>
" Buffers
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>b<Left> :bp<CR>
nnoremap <leader>b<Right> :bn<CR>

" Plugins
lua require("basic")
nnoremap <leader>p :vsplit ~/.config/nvim/lua/plugins.lua<CR>


" Telescope.vim
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <F4> <cmd>Telescope<CR>

" Airline
"let g:airline_powerline_fonts = 1
"let g:airline_theme="typewriter"

"" NvimTree
nnoremap <leader>d :NvimTreeToggle<CR>

" Neovide
if exists("g:neovide")
  " Put anything you want to happen only in Neovide here
  let g:neovide_floating_blur_amount_x = 2.0
  let g:neovide_floating_blur_amount_y = 2.0
  let g:neovide_fullscreen=v:true
  let g:neovide_profiler = v:false
  let g:neovide_cursor_vfx_mode = "wireframe"
  let g:neovide_hide_mouse_when_typing = v:true
endif

" Which-key.nvim
set timeoutlen=200

" lightline.vim
let g:lightline = {
      \ 'enable':{'tabline':0},
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode'],[ 'relativepath' ,'filetype',],
      \             [ 'gitbranch', 'readonly',], ['modified' ] ],
      \   'right': [['percent','lineinfo'],[ 'time']],
      \ },
      \ 'component_function':{'time':'GetTime',}
      \ }
" let g:lightline = {
"       \ 'colorscheme': 'typewriter_light',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'relativepath' ,'filetype',],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"       \ },
"       \ }
"
"
let g:lightline.separator = { 'left': '', 'right': ''}
let g:lightline.subseparator = { 'left': '', 'right': ''}

function! GetTime()
  return "⌚" . strftime('%H:%M')
endfunction

" let g:AutoPairsFlyMode=1

" Vim-Tex
let g:vimtex_view_method = 'zathura'
let maplocalleader = " "

" Nvim-dap
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>bt <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>bc <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
