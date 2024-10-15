return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- high priority = earlier download
    config = function()
        vim.cmd.colorscheme "catppuccin"
        --vim.api.nvim_set_hl(0, "Normal", { bg = "#00000080" })
        --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#00000080" })
    end,
}
