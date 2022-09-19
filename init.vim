" - Pre-Config with lua
lua require("basic")
nnoremap <leader>p :vsplit ~/.config/nvim/lua/plugins.lua<CR>

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
"colorscheme nord
colorscheme typewriter
" Background
set background=light
" True Colors
set tgc
" More settings
" highlight Pmenu ctermfg=8 ctermbg=0 guibg=Black
" highlight Constant ctermfg=45 guifg=#00d7ff
" highlight PmenuSbar ctermfg=8 ctermbg=0 guibg=Grey

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
" Ctrl-S will Save Current File
nnoremap <silent><leader>s :Neoformat<cr>:w<cr>
" Ctrl-H will Show Help
" nnoremap <c-h> :help 
" Ctrl-Z
"noremap <silent><C-z> :earlier<cr>
" Ctrl-Y
noremap <silent><C-y> :later<cr>
" Format
nnoremap <silent><leader><leader> :Neoformat<cr>
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


" Telescope.vim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <F4> <cmd>Telescope<cr>

" Extensions
let g:coc_global_extensions = ['coc-clangd','coc-eslint','coc-git','coc-highlight','coc-json','coc-markdownlint','coc-nav','coc-pairs','coc-python','coc-rust-analyzer','coc-sh','coc-stylua','coc-sumneko-lua','coc-tsserver','coc-vimlsp','coc-yaml']
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Airline
"let g:airline_powerline_fonts = 1
"let g:airline_theme="typewriter"

"" NvimTree
"nnoremap <leader>d :NvimTreeToggle<CR>

" Neovide
if exists("g:neovide")
  " Put anything you want to happen only in Neovide here
  let g:neovide_floating_blur_amount_x = 2.0
  let g:neovide_floating_blur_amount_y = 2.0
  let g:neovide_fullscreen=v:false
  let g:neovide_profiler = v:false
  let g:neovide_cursor_vfx_mode = "wireframe"
endif

" Which-key.nvim
set timeoutlen=200

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'typewriter_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
