-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.termguicolors = true
-- then you need to set the option below.
vim.g.lazyvim_picker = "snacks"
vim.g.snacks_animate = false
-- vim.opt.guicursor = ""
--
if vim.g.neovide then
  require("config.neovide")
end
