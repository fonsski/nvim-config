set mouse=a
set encoding=utf-8
set number
set cursorline
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on

set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

set splitbelow
set splitright

inoremap jk <esc>

call plug#begin('~/.vim/plugged')

" Core plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" File tree
Plug 'nvim-tree/nvim-tree.lua'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'

Plug 'xiyaowong/nvim-transparent'

Plug 'Pocco81/auto-save.nvim'
Plug 'justinmk/vim-sneak'

" Frontend support
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'bmatcuk/stylelint-lsp'

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" PHP (using coc)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Leader bind to space
let mapleader = " "

" Configure nvim-tree
lua << EOF
require('nvim-tree').setup {
    view = {
        width = 30,
        side = 'left',
    },
    renderer = {
        highlight_opened_files = "all",
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}
EOF

nnoremap <leader>e :NvimTreeToggle<CR>

" Prettier settings
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Coc configuration
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-tsserver', 'coc-json', 'coc-prettier', 'coc-phpls']
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

colorscheme gruvbox

if (has('termguicolors'))
  set termguicolors
endif

" Disable search highlight
nnoremap ,<space> :nohlsearch<CR>

" Telescope bindings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" Save automatically on focus change
lua << EOF
require("auto-save").setup {}
EOF

