return require("lazy").setup({
  -- Telescope для поиска
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Neo-tree для файлового дерева
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- для иконок файлов
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Пример базовой настройки neo-tree (можно расширять)

      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
  },

  -- Treesitter для улучшенной подсветки синтаксиса и анализа кода
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "php", "javascript", "html", "css", "python" },
        highlight = { enable = true },
      })
    end,
  },

  -- LSP: базовая настройка для языковых серверов
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Пример настройки LSP для PHP и Python
      local lspconfig = require("lspconfig")
      -- Настройка PHP (например, using intelephense, если установлен)
      lspconfig.intelephense.setup {}
      -- Настройка Python (например, pyright)
      lspconfig.pyright.setup {}
      -- Добавь другие серверы по необходимости
    end,
  },

  -- Автодополнение: nvim-cmp и зависимости
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- источники LSP
      "hrsh7th/cmp-buffer",    -- источники буфера
      "hrsh7th/cmp-path",      -- источники путей
      "hrsh7th/cmp-cmdline",   -- источники командной строки
      "saadparwaiz1/cmp_luasnip", -- интеграция с LuaSnip
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },

  -- Сниппеты: LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "1.*", -- убедись, что используешь совместимую версию
  },

  -- Автопаринг скобок и кавычек
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  -- Темы: можно выбрать несколько, а затем менять по необходимости
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- Чтобы выбрать тему, раскомментируй одну из строк
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
  "akinsho/nvim-bufferline.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        numbers = "ordinal",              -- нумерация буферов
        close_command = "bdelete! %d",      -- команда закрытия буфера по клику на крестик
        indicator = {
          icon = "▎",                     -- иконка индикатора активного буфера
          style = "icon",
        },
        separator_style = "slant",          -- стиль разделителей
        show_close_icon = false,            -- скрываем общий крестик для закрытия
        show_buffer_close_icons = true,     -- показываем крестики для каждого буфера
        diagnostics = "nvim_lsp",           -- если хочешь отображать диагностику на буферах
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "center",
            padding = 1,
          }
        },
      },
    }
  end,
},
{
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {}
  end,
},

})

