function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

vim.g.mapleader = " "

nmap("<leader>pv", ":Ex<CR>")
nmap("<leader><CR>", ":source $MYVIMRC<CR>")
nmap("<leader>ff", "<cmd>Telescope find_files<CR>")
nmap("<C-j>", ":cnext<CR>")
nmap("<C-k>", ":cprev<CR>")


-- nnoremap
-- n stands for mode (normal mode)
-- noremap stands for dont recurrsively do this ish
