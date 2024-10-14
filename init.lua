require("miku")








vim.g.mapleader = " "
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("source " .. vim.fn.expand("$HOME/.config/nvim2/init.lua"))
end)
