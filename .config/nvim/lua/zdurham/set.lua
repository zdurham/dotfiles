vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- netrw customizations
vim.g.netrw_banner = 0

-- no text wrap please
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- highlight the cursor line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.cmd[[hi CursorLineNr guifg=#2abffa]]
vim.cmd[[set noshowmode]]
