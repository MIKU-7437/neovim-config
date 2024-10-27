-- Navigation and cursor movement
map('n', 'J', [[m'Jz]])      -- Join lines without moving cursor
map('n', '<C-d>', '<C-d>zz') -- Scroll down and center cursor
map('n', '<C-u>', '<C-u>zz') -- Scroll up and center cursor
map('n', 'n', 'nzzzv')       -- Move to next search result and center cursor
map('n', 'N', 'Nzzzv')       -- Move to prev search result and center cursor

-- Clipboard and deletion behavior
map('x', '<leader>p', [['_dP]])         -- Paste over selections without yanking it
map({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard
map("n", "<leader>Y", [["+Y]])          -- Yank entire line to system clipboard
map({ "n", "v" }, "<leader>d", [["_d]]) -- Delete without yanking it

-- LSP diagnostics nagigation
map("n", "<leader>k", vim.diagnostic.goto_next) -- Go to next diagnostic
map("n", "<leader>j", vim.diagnostic.goto_prev) -- Go to prev diagnostic

-- Move block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv") -- Move selected text on 1 line down
map("v", "K", ":m '<-2<CR>gv=gv") -- Move selected text on 1 line up

-- Search and replace
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace word under cursor

-- File permissions and commands
map("n", "<leader>x", "<cmd>!chmod +x %<CR>") -- Make file executable

-- Reload and sace configuration
map('n', '<leader><leader>', ':source $MYVIMRC<CR>') -- Reload current config
map("n", "<leader>w", "<CMD>update<CR>")             -- Save current file

-- Quit command
map("n", "<leader>q", "<CMD>q<CR>")

-- Insert mode exit shortcut
map("i", "jk", "<ESC>")

-- NeoTree (lua.miku.plugins.neotree) file explorer
-- map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
-- map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- Window management
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
