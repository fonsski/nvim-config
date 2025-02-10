# Neovim Configuration Documentation

## Установка

### Linux (Debian/Ubuntu)
```bash
# Установка необходимых зависимостей
sudo apt update
sudo apt install neovim git ripgrep fd-find nodejs npm

# Установка языковых серверов
sudo npm install -g pyright
sudo npm install -g intelephense
sudo apt install clangd
```

### macOS
```bash
# Установка через Homebrew
brew install neovim git ripgrep fd node

# Установка языковых серверов
npm install -g pyright
npm install -g intelephense
brew install llvm # для clangd
```

### Windows
```powershell
# Установка через Scoop
scoop install neovim git ripgrep fd nodejs

# Установка языковых серверов
npm install -g pyright
npm install -g intelephense
# Для C/C++ скачайте LLVM с официального сайта
```

### Установка конфигурации
```bash
# Создайте директорию для конфигурации, если её нет
mkdir -p ~/.config/nvim

# Клонируйте репозиторий
git clone https://github.com/fonsski/nvim-config.git ~/.config/nvim
```

## Основные возможности

### Поддерживаемые языки программирования
- PHP (через intelephense)
- Python (через pyright)
- C/C++ (через clangd)
- JavaScript
### А так же языки разметки
- HTML
- CSS

### Ключевые плагины
1. **Telescope** - fuzzy поиск файлов и текста
2. **Neo-tree** - файловый менеджер
3. **Treesitter** - улучшенная подсветка синтаксиса
4. **LSP** - языковые серверы для автодополнения и анализа кода
5. **nvim-cmp** - автодополнение
6. **LuaSnip** - сниппеты
7. **Bufferline** - управление буферами
8. **Auto-save** - автоматическое сохранение

## Горячие клавиши

### Основные команды
- `<Space>` - клавиша leader
- `:Telescope find_files` - поиск файлов
- `:Telescope live_grep` - поиск текста
- `:Telescope colorscheme` - выбор темы оформления

### Файловый менеджер (Neo-tree)
- `:Neotree` - открыть/закрыть файловый менеджер

### LSP
- `gd` - перейти к определению
- `K` - показать документацию
- `[d` - предыдущая диагностика
- `]d` - следующая диагностика

### Автодополнение
- `Tab` - следующий вариант автодополнения
- `Shift+Tab` - предыдущий вариант
- `Enter` - выбрать вариант

## Настройка

### Добавление новых языковых серверов
В файле `lua/plugins.lua` найдите конфигурацию `nvim-lspconfig` и добавьте новый сервер:
```lua
lspconfig.your_language_server.setup{}
```

### Изменение темы
В файле `lua/plugins.lua` найдите секцию с темами и измените строку:
```lua
vim.cmd("colorscheme your_theme")
```

### Автосохранение
Плагин auto-save активен по умолчанию. Для настройки отредактируйте конфигурацию в `lua/plugins.lua`:
```lua
require("auto-save").setup {
    -- ваши настройки
}
```

## Требования к системе
- Neovim >= 0.8.0
- Git
- Node.js >= 12.0
- Ripgrep (для поиска текста)
- fd (для поиска файлов)

## Обновление
```bash
# Обновление плагинов
:Lazy update

# Обновление языковых серверов
npm update -g pyright
npm update -g intelephense
```

## Устранение неполадок

### Распространенные проблемы
1. **Не работает автодополнение:**
   - Проверьте установку языковых серверов
   - Убедитесь, что LSP сервер запущен `:LspInfo`

2. **Не отображаются иконки:**
   - Установите Nerd Font
   - Настройте терминал на использование Nerd Font

3. **Проблемы с Telescope:**
   - Проверьте установку ripgrep и fd
   - Проверьте права доступа к директориям

### Диагностика
```vim
:checkhealth
:LspInfo
:TSInstallInfo
```

## Кастомизация

### Добавление собственных горячих клавиш
Отредактируйте файл `lua/keymaps.lua`:
```lua
vim.keymap.set('n', '<your_key>', '<your_command>', { noremap = true })
```

### Добавление новых плагинов
Добавьте новый плагин в `lua/plugins.lua`:
```lua
{
    "author/plugin-name",
    config = function()
        -- настройка плагина
    end
}
```
