vim.cmd[[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

    use 'folke/tokyonight.nvim'

	use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }})
	use 'ThePrimeagen/harpoon'

	-- lsp configuration
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	  }
	}

    use {
        'numToStr/Comment.nvim',
        config = function()
            vim.keymap.set("n", '<leader>/', function() require("Comment.api").toggle.linewise.current() end)
            vim.keymap.set("v", '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
            -- don't want to use comment's mappings, just my own
            require("Comment").setup({ mappings = false })
        end
    }
    use 'xiyaowong/nvim-transparent'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- git integrations
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use 'dinhhuy258/git.nvim'
end)
