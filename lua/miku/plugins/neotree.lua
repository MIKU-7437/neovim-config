return {
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require('nvim-web-devicons').setup {
                override = {
                    zsh = {
                        icon = "",
                        color = "#428850",
                        cterm_color = "65",
                        name = "Zsh"
                    }
                },
                color_icons = true,
                default = true,
                strict = true,
                variant = "light|dark",
                override_by_filename = {
                    [".gitignore"] = {
                        icon = "",
                        color = "#f1502f",
                        name = "Gitignore"
                    }
                },
                override_by_extension = {
                    ["log"] = {
                        icon = "",
                        color = "#81e043",
                        name = "Log"
                    }
                },
                override_by_operating_system = {
                    ["apple"] = {
                        icon = "",
                        color = "#A2AAAD",
                        cterm_color = "248",
                        name = "Apple",
                    },
                },
            }
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- Плавающее окно
                        ["L"] = "focus_preview",
                        ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                        ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                        ["<S-CR>"] = "system_open",
                        ["<Space>"] = false,
                        O = "system_open",
                        Y = "copy_selector",
                        h = "parent_or_close",
                        l = "child_or_open",
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
                        visible = false,
                        hide_dotfiles = true,   -- Показывать скрытые файлы
                        hide_gitignored = true, -- Показывать файлы, игнорируемые git
                        hide_hidden = true,     -- Показывать скрытые файлы и директории
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

                commands = {
                    system_open = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        vim.fn.jobstart({ "xdg-open", path }, { detach = true })
                    end,
                    parent_or_close = function(state)
                        local node = state.tree:get_node()
                        if node:has_children() and node:is_expanded() then
                            state.commands.toggle_node(state)
                        else
                            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                        end
                    end,
                    child_or_open = function(state)
                        local node = state.tree:get_node()
                        if node:has_children() then
                            if not node:is_expanded() then -- if unexpanded, expand
                                state.commands.toggle_node(state)
                            else                           -- if expanded and has children, seleect the next child
                                if node.type == "file" then
                                    state.commands.open(state)
                                else
                                    require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                                end
                            end
                        else -- if has no children
                            state.commands.open(state)
                        end
                    end,
                    copy_selector = function(state)
                        local node = state.tree:get_node()
                        local filepath = node:get_id()
                        local filename = node.name
                        local modify = vim.fn.fnamemodify

                        local vals = {
                            ["BASENAME"] = modify(filename, ":r"),
                            ["EXTENSION"] = modify(filename, ":e"),
                            ["FILENAME"] = filename,
                            ["PATH (CWD)"] = modify(filepath, ":."),
                            ["PATH (HOME)"] = modify(filepath, ":~"),
                            ["PATH"] = filepath,
                            ["URI"] = vim.uri_from_fname(filepath),
                        }

                        local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
                        table.sort(options)

                        vim.ui.select(options, {
                            prompt = "Choose to copy to clipboard:",
                            format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
                        }, function(choice)
                            local result = vals[choice]
                            if result then
                                vim.notify(("Copied: `%s`"):format(result), vim.log.levels.INFO)
                                vim.fn.setreg("+", result)
                            end
                        end)
                    end
                },
            })
            -- -- Клавиша для открытия/закрытия Neo-tree
            map('n', '<leader>n', ':Neotree filesystem reveal toggle<CR>', {})
            map('n', '<leader>e', function()
                if vim.bo.filetype == "neo-tree" then
                    vim.cmd.wincmd("p")
                else
                    vim.cmd.Neotree("focus")
                end
            end, { desc = "Toggle Explorer Focus" })
        end
    },
}
