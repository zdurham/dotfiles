local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use 'tpope/vim-markdown' -- parse markdown

  use 'folke/tokyonight.nvim' -- theme

  use 'nvim-lua/plenary.nvim' -- utility functions
  use 'nvim-telescope/telescope.nvim' -- fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- file browser 
  use 'neovim/nvim-lspconfig' -- common lsp configurations
  use 'glepnir/lspsaga.nvim' -- LSP UIs!

  
  -- TODO add completion


  -- lualine yoooo
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use {
  	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

end)
