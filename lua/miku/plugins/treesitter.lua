return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                sync_install = true,
                ignore_install = {},
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_hightlighting = false,
                },
                indent = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                ensure_installed = {
                    "python",
                    "lua",
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "c",
                    "rust",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<S-Tab>",
                    },
                },
                rainbow = {
                    enable = true,
                    disable = { "html" },
                    extended_mode = false,
                    max_file_lines = nil,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                textobjects = {
                    enable = true,
                },
            })

            vim.o.foldmethod = "expr"
            vim.o.foldexpr = "nvim_treesitter#foldexpr()"
            vim.o.foldlevel = 99

            require("treesitter-context").setup({
                enable = true,
                throttle = true,
                max_lines = 0,
                pattern = {
                    default = {
                        "class",
                        "function",
                        "method",
                    },
                },
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                -- scope = {
                --     show_start = false,
                --     show_end = false,
                -- },
                exclude = {
                    filetypes = { "help", "terminal" },
                    buftypes = { "nofile", "terminal" },
                },
            })
        end,
    },
}
