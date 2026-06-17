local opts = {
    noremap = true,
    silent = true
}

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resizing windows
-- vim.keymap.set("n", "<leader>(", "<cmd>vertical resize -2<cr>", opts)
-- vim.keymap.set("n", "<leader>)", "<cmd>vertical resize +3<cr>", opts)

-- Buffers (not currently in use)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>")
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>")
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", opts)

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")


-- Diagnostics
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

-- vim.keymap.set("n", "]d", diagnostic_goto(true), opts)
-- vim.keymap.set("n", "[d", diagnostic_goto(false), opts)
-- vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), opts)
-- vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), opts)
-- vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), opts)
-- vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), opts)


-- Windows
vim.keymap.set("n", "<leader>-", "<C-W>s", opts)
vim.keymap.set("n", "<leader>v", "<C-W>v", opts)
vim.keymap.set("n", "<leader>wd", "<C-W>c", opts)
