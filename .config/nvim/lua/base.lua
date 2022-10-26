vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.signcolumn = "number"
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.wo.cursorline = true
vim.wo.cursorlineopt = "number"
vim.cmd[[hi CursorLineNr guifg=#2abffa]]

vim.opt.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_italic_keywords = false
vim.g.lightline = { colorscheme = 'tokyonight' }
vim.cmd[[colorscheme tokyonight]]

-- for astro
vim.filetype.add({
  extension = {
    astro = "astro"
  }
})

