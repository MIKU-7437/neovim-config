return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('nvim-web-devicons').setup {
            -- your personnal icons can go here (to override)
            -- you can specify color or cterm_color instead of specifying both of them
            -- DevIcon will be appended to `name`
            override = {
                zsh = {
                    icon = "",
                    color = "#428850",
                    cterm_color = "65",
                    name = "Zsh"
                }
            },
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = true,
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true,
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true,
            -- set the light or dark variant manually, instead of relying on `background`
            -- (default to nil)
            variant = "light|dark",
            -- same as `override` but specifically for overrides by filename
            -- takes effect when `strict` is true
            override_by_filename = {
                [".gitignore"] = {
                    icon = "",
                    color = "#f1502f",
                    name = "Gitignore"
                }
            },
            -- same as `override` but specifically for overrides by extension
            -- takes effect when `strict` is true
            override_by_extension = {
                ["log"] = {
                    icon = "",
                    color = "#81e043",
                    name = "Log"
                }
            },
            -- same as `override` but specifically for operating system
            -- takes effect when `strict` is true
            override_by_operating_system = {
                ["apple"] = {
                    icon = "",
                    color = "#A2AAAD",
                    cterm_color = "248",
                    name = "Apple",
                },
            },
        }

        require("neo-tree").setup({
            window = {
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- Плавающее окно
                    ["L"] = "focus_preview",
                    ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                    ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                }
            },
            default_component_configs = {
                icon = { folder_empty = "󰉖", default = "" },
                modified = { symbol = "" },
                git_status = {
                    symbols = {
                        added = "",
                        modified = "",
                        deleted = "✖",
                        renamed = "",
                        untracked = "?",
                        ignored = "◌",
                        unstaged = "○",
                        staged = "●",
                        conflict = "◎",
                    },
                },
                file_size = { required_width = 48 },
                last_modified = { required_width = 72 },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,   -- Показывать скрытые файлы
                    hide_gitignored = false, -- Показывать файлы, игнорируемые git
                    hide_hidden = false,     -- Показывать скрытые файлы и директории
                },
                follow_current_file = {
                    enabled = true, -- Update to the new table format
                },
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_current",
            },
            buffers = {
                follow_current_file = {
                    enabled = true, -- Update to the new table format
                },
            },
            enable_git_status = true,
            git_status = {
                window = {
                    position = "float", -- плавающее окно
                },
            },

        })

        -- Клавиша для открытия/закрытия Neo-tree
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal toggle<CR>', {})
        vim.keymap.set("n", "<leader>r", "<CMD>Neotree focus<CR>", {})
    end
}
