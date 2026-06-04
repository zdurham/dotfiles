
-- Activiations
vim.lsp.enable('lua_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('rust_analyzer')

-- Keymaps
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "H", vim.lsp.buf.hover, { desc = "Hover (alt)" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
