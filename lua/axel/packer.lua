-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Themes
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

    use "rebelot/kanagawa.nvim"
    use 'navarasu/onedark.nvim'
  ------------------------------------
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")
  use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  use("lewis6991/gitsigns.nvim")
  use('brenoprata10/nvim-highlight-colors')
  --use('yamatsum/nvim-nonicons')
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}
  use('sopa0/telescope-makefile')
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')
  use('nvim-tree/nvim-web-devicons')

  use 'akinsho/nvim-bufferline.lua'

  --Mason
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason-lspconfig.nvim'

  --lsp
    use 'mfussenegger/nvim-dap' --debugging
    use 'rcarriga/cmp-dap' --debugging
    use 'mfussenegger/nvim-jdtls'
    use 'nvim-lua/plenary.nvim'
    use 'hrsh7th/nvim-cmp'
    use	'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --nvim tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }

    --chatgpt
    use({
      "jackMort/ChatGPT.nvim",
      config = function()
          require("chatgpt").setup()
      end,
      requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
      }
  })

  --Comment plugin
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  -- Markdown plugin
  -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    --Indent blankline (like intellij line)
    use "lukas-reineke/indent-blankline.nvim"

    --Tabhula use to "tab-out" auto-closed parenthesis, braces, etc
    use 'lilibyte/tabhula.nvim'
end)

