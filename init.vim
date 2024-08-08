" Инициализация vim-plug
call plug#begin('~/.vim/plugged')

" Плагины для LSP и автодополнения
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Плагины для PHP
Plug 'neovim/nvim-lspconfig'

" Плагины для JavaScript, CSS, HTML
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
" Плагины для работы с Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Плагины для поиска и дерева файлов
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Плагин для форматирования кода
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['php', 'javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html'] }

" Тема и прозрачность
Plug 'morhetz/gruvbox'
Plug 'xiyaowong/transparent.nvim'

call plug#end()

" Основные настройки Neovim
set mouse=a
set encoding=utf-8
set number
set cursorline
set noswapfile
set scrolloff=7
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set clipboard+=unnamedplus

" Лидер-клавиша
let mapleader = " "

" Настройка автодополнения
lua << EOF
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  }
}
EOF

" Настройка LSP для PHP (intelephense)
lua << EOF
require'lspconfig'.intelephense.setup{}
EOF

" Настройка LSP для CSS, HTML, JavaScript
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
EOF

" Настройка дерева файлов
lua << EOF
require'nvim-tree'.setup {
  view = {
    width = 30,
    side = 'left',
  },
  filters = {
    dotfiles = true,
  },
}
EOF

" Настройка поиска файлов
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Открытие дерева файлов
nnoremap <leader>e :NvimTreeToggle<CR>

" Настройка форматирования кода
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Команды для запуска PHP файлов
autocmd FileType php map <buffer> <C-h> :w<CR>:exec '!php' shellescape(@%, 1)<CR>
autocmd FileType php imap <buffer> <C-h> <esc>:w<CR>:exec '!php' shellescape(@%, 1)<CR>

" Настройки для Emmet
let g:user_emmet_leader_key=','
autocmd FileType html,css,php,jsx,tsx EmmetInstall

" Клавиши для перехода между буферами
map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>

" Открыть новую вкладку
nnoremap <leader>tn :tabnew<CR>

" Переключиться на следующую вкладку
nnoremap <leader>tl :tabnext<CR>

" Переключиться на предыдущую вкладку
nnoremap <leader>th :tabprev<CR>

" Закрыть текущую вкладку
nnoremap <leader>tc :tabclose<CR>

" Открыть список вкладок
nnoremap <leader>tt :tabs<CR>


" Отключение навигации по клавишам h,j,k,l 
nnoremap h <nop>
nnoremap j <nop>
nnoremap k <nop>
nnoremap l <nop>

" Настройка темы Gruvbox
set background=dark
colorscheme gruvbox

" Настройка прозрачности
lua << EOF
require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups
  exclude_groups = {}, -- table: groups you don't want to clear
})
EOF

