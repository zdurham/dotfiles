local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep)


-- telescope git functionality
vim.keymap.set('n', '<leader>gt', builtin.git_status)
vim.keymap.set('n', '<leader>gb', builtin.git_branches)
