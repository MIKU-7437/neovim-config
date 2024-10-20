return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.g.tmux_navigator_no_mappings = 1
        vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'window left' })
        vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'window down' })
        vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'window up' })
        vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'window right' })
    end
}
