local status, packer = pcall(require, 'packer')
if (not status) then
  print("packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use { 'williamboman/mason.nvim' }
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'hoob3rt/lualine.nvim' -- statusline 
  use 'onsails/lspkind-nvim' -- vscode like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp for nvim built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig' -- LSP
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'nvim-tree/nvim-web-devicons'
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
  })
  use ({
    'craftzdog/solarized-osaka.nvim'
  })
  use 'lewis6991/gitsigns.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'williamboman/mason.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    require = {
      'nvim-tree/nvim-web-devicons',
    }
  }
end)

