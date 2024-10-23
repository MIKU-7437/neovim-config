-- Alias for global options and vim options
local o = vim.opt

-- Tabs and indentation settings
o.tabstop = 4        -- Number of spaces that a <Tab> counts for
o.softtabstop = 4    -- Number of spaces a <Tab> inserts in insert mode
o.shiftwidth = 4     -- Number of spaces for each step of (auto)indent
o.expandtab = true   -- Convert tabs to spaces
o.smartindent = true -- Smart indentation based on syntax

-- Text formatting
o.wrap = false -- Disable line wrapping

-- Search settings
o.hlsearch = false -- Disable highlighting of search matches
o.incsearch = true -- Enable incremental search (highlight matches as you type)

-- UI settings
o.termguicolors = true -- Enable 24-bit RGB colors
o.scrolloff = 8        -- Keep 8 lines visible above and below the cursor
o.signcolumn = "yes"   -- Always show the sign column (used for LSP, git signs, etc.)

-- File handling and cursor behavior
o.isfname:append("@-@") -- Allow "@" in file names

-- Column indicator
o.colorcolumn = "80" -- Highlight column at 80 characters for line length limit

-- Performance
o.updatetime = 100 -- Reduce update time for better responsiveness (default is 4000ms)

-- Editor options
o.number = true             -- Show absolute line numbers
o.relativenumber = true     -- Show relative line numbers for easier navigation
o.clipboard = "unnamedplus" -- Use system clipboard for all operations except yank
o.syntax = "on"             -- Enable syntax highlighting
-- o.autoindent = true       -- (Optional) Copy indent from current line when starting a new line
o.cursorline = true         -- (Optional) Highlight the line where the cursor is located
o.expandtab = true          -- Convert tabs to spaces (redundant but left for clarity)
o.shiftwidth = 4            -- Number of spaces for each step of (auto)indent (repeated)
o.tabstop = 4               -- Number of spaces that a <Tab> counts for (repeated)

-- Optional settings (commented out)
-- o.encoding = "UTF-8"     -- Set file encoding to UTF-8
-- o.ruler = true           -- Show cursor position in the status line
-- o.mouse = "a"            -- Enable mouse in all modes
-- o.title = true           -- Set terminal title to window title
-- o.hidden = true          -- Keep buffers hidden when abandoned
-- o.ttimeoutlen = 0        -- Timeout for key sequences in milliseconds
-- o.wildmenu = true        -- Enhanced command-line completion
-- o.showcmd = true         -- Show command being typed in the status line
-- o.showmatch = true       -- Highlight matching parentheses or brackets
-- o.inccommand = "split"   -- Show preview of search and replace results in a split
-- o.splitright = true      -- Open new vertical splits to the right of the current window
-- o.splitbelow = true      -- Open new horizontal splits below the current window
-- o.termguicolors = true   -- 24-bit color support (repeated)

-- Set default shell to zsh
vim.opt.shell = '/usr/bin/zsh'
