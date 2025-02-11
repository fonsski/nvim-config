local opts = { noremap = true, silent = true }

-- Telescope: поиск файлов
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)

-- Telescope: поиск по содержимому
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
-- Neotree: вызов дерева файлов
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Привязка для плавающего Neo-tree
vim.keymap.set("n", "<leader>E", ":Neotree float<CR>", { noremap = true, silent = true })

-- Привязка для выбора тем через Telescope
vim.keymap.set('n', '<leader>th', ':Telescope colorscheme<CR>', { noremap = true, silent = true })

-- Открытие терминала в вертикальном сплите с шириной 80 столбцов
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("rightbelow vsplit term://$SHELL")
    vim.cmd("vertical resize 80")
    vim.cmd("startinsert")
end, { noremap = true, silent = true })

vim.keymap.set("t", "tc", function()
    vim.cmd("stopinsert")
    vim.defer_fn(function()
        vim.api.nvim_win_close(0, true)
    end, 100)
end, { noremap = true, silent = true })

-- Для всех буферов: в режиме вставки сочетание jk работает как <Esc>
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- Отключение подсветки поиска
-- Для терминального режима:
-- По умолчанию, чтобы выйти из терминального режима в нормальный, нужно нажать <C-\\><C-n>
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- Переход к следующему буферу
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })

-- Переход к предыдущему буферу
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true })

-- Закрытие текущего буфера
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
