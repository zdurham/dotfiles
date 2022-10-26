local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]


packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use 'tpope/vim-markdown' -- parse markdown
  use 'folke/tokyonight.nvim' -- theme
  -- 
  use 'onsails/lspkind-nvim'
  -- autocomplete plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"

  use 'kyazdani42/nvim-web-devicons'

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"


  use 'nvim-lua/plenary.nvim' -- utility functions
  use 'nvim-telescope/telescope.nvim' -- fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- file browser 

  use 'neovim/nvim-lspconfig' -- common lsp configurations
  use 'glepnir/lspsaga.nvim' -- LSP UIs!

  use 'jose-elias-alvarez/null-ls.nvim'
  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- lualine yoooo
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use {
  	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- git decorations
  use 'lewis6991/gitsigns.nvim'
end)
