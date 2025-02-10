-- Устанавливаем клавишу лидер (space)
vim.g.mapleader = " "

-- Загружаем базовые опции
require("options")

-- Загружаем горячие клавиши
require("keymaps")

-- Bootstrap lazy.nvim, если он ещё не установлен
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Загружаем конфигурацию плагинов
require("plugins")
