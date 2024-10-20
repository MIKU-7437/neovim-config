return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")

            telescope.load_extension("ui-select")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })


            local keymap = vim.keymap
            keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
            keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep search in cwd" }) -- Поиск строк
            keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })         -- Поиск по открытым буферам
            keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Show git status" })        -- Статус Git
            keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" })      -- История коммитов
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
