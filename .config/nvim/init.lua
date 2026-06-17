require('options')
require('keymaps')
require('diagnostics');
require('lsp')

-- Neovide
if vim.g.neovide then
  require("neovide")
end
