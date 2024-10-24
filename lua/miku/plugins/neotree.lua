return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
        { "MunifTanjim/nui.nvim",  lazy = true },
        { "nvim-web-devicons",     lazy = true },
    },
    cmd = "Neotree",
    opts = function()
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
            variant = "dark",
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

        local git_available = vim.fn.executable "git" == 1
        vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal toggle<CR>', {})
        vim.keymap.set('n', '<leader>r', function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd("p")
            else
                vim.cmd.Neotree("focus")
            end
        end, { desc = "Toggle Explorer Focus" })
        return {
            enable_git_status = git_available,
            auto_clean_after_session_restore = true,
            close_if_last_window = true,
            sources = { "filesystem", "buffers", git_available and "git_status" or nil },
            commands = {
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
                        if not node:is_expanded() then
                            state.commands.toggle_node(state)
                        else
                            if node.type == "file" then
                                state.commands.open(state)
                            else
                                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                            end
                        end
                    else
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
                end,
            },
            window = {
                width = 30,
                mappings = {
                    ["<S-CR>"] = "system_open",
                    ["<Space>"] = false,
                    ["[b"] = "prev_source",
                    ["]b"] = "next_source",
                    O = "system_open",
                    Y = "copy_selector",
                    h = "parent_or_close",
                    l = "child_or_open",
                    P = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
                    L = "focus_preview",
                    ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                    ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                },
                fuzzy_finder_mappings = {
                    ["<C-J>"] = "move_cursor_down",
                    ["<C-K>"] = "move_cursor_up",
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,   -- Show dotfiles
                    hide_gitignored = false, -- Show git-ignored files
                    hide_hidden = false,     -- Show hidden files and directories
                },
                group_empty_dirs = true,
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(_)
                        vim.opt_local.signcolumn = "auto"
                        vim.opt_local.foldcolumn = "0"
                    end,
                },
            },
            git_status = {
                window = {
                    position = "float", -- Use floating window for git status
                },
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
        }
    end,
}
