-- Показываем абсолютные и относительные номера строк
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- LSP настройки
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- Подсветка при наведении
vim.cmd [[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false })
]]

-- Настройки для более удобной работы с LSP
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
