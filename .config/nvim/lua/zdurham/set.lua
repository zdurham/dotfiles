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
-- make the signcolumn background transparent
vim.cmd[[hi SignColumn guibg=NONE]]

-- set the background to be transparent
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[hi NormalFloat guibg=NONE ctermbg=NONE]]


