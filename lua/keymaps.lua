-- ~/.config/nvim/lua/keymaps.lua

local opts = { noremap = true, silent = true }

-- Telescope: поиск файлов
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)

-- Telescope: поиск по содержимому
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Открытие терминала в горизонтальном сплите с высотой 15 строк
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("split term://$SHELL")
  vim.cmd("resize 15")
  vim.cmd("startinsert")
end, { noremap = true, silent = true })

-- Для всех буферов: в режиме вставки сочетание jk работает как <Esc>
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Для терминального режима:
-- По умолчанию, чтобы выйти из терминального режима в нормальный, нужно нажать <C-\\><C-n>
-- Теперь мы делаем сочетание jk эквивалентным этому действию
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- Переход к следующему буферу
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })

-- Переход к предыдущему буферу
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true })

-- Закрытие текущего буфера
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })

-- (Опционально) Быстрый переход к буферу по номеру (если нумерация включена)
vim.keymap.set("n", "<leader>1", "1gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", "2gt", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", "3gt", { noremap = true, silent = true })

