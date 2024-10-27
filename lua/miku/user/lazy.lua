vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Общие плагины
    { import = "miku.plugins" },

    -- Python/Jupyter плагины
    { import = "miku.plugins.python" },
}, {
    checker = {
        enabled = true,
        notify = false, -- Отключить уведомления об обновлениях
    },
    change_detection = {
        notify = false, -- Отключить уведомления при изменении конфигурации
    },
})
