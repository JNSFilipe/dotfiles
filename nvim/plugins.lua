return require("packer").startup(function(use)

  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Which Key, this config is built around it
  use "folke/which-key.nvim"

  -- File Explorer
  -- use {"kyazdani42/nvim-tree.lua", requires={'kyazdani42/nvim-web-devicons'}} -- 'kyazdani42/nvim-web-devicons' is optional, for file icons
  use {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"}} -- "kyazdani42/nvim-web-devicons" is not strictly required, but recommended

  -- Terminal Emulation
  use {"akinsho/toggleterm.nvim", tag = "v2.*"}

  -- Navigation
  use {"phaazon/hop.nvim", branch = "v2"}

  -- Coding
  ---- Completion
  use "hrsh7th/nvim-cmp"                  -- completion plugin
  use "hrsh7th/cmp-buffer"                -- buffer completions
  use "hrsh7th/cmp-path"                  -- path completions
  use "hrsh7th/cmp-cmdline"               -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"              -- integration with lsp
  use "hrsh7th/cmp-emoji"
  ---- Snippets
  use "L3MON4D3/LuaSnip"                  -- snippet engine 
  use "saadparwaiz1/cmp_luasnip"          -- integration with cmp
  use "rafamadriz/friendly-snippets"      -- actual snippets
  ---- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"   -- TODO replace with meson.nvim
  ---- Better Syntax Highlighting
  use { "nvim-treesitter/nvim-treesitter", run = "<cmd>TSUpdate<CR>"}
  use "p00f/nvim-ts-rainbow"              -- different colours for matching parenthesis
  ---- Others
  use "windwp/nvim-autopairs"             -- automatically closes parenthisis, brackets, etc, integrates with both cmp and treesitter

  -- Themes
  use "shaunsingh/nord.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

