local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- theme
  use 'navarasu/onedark.nvim'

  -- powerline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  -- Git related
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- show potential keybindings
  use 'folke/which-key.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use { 'alexghergh/nvim-tmux-navigation', config = function()
        require'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                next = "<C-Space>",
            }
        }
    end
  }

  -- LSP
  use {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'j-hui/fidget.nvim'},
      {'folke/neodev.nvim'},
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      { 'saadparwaiz1/cmp_luasnip'},
      { 'rafamadriz/friendly-snippets'},
  }

  -- latex
  use 'lervag/vimtex'

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
  }

  use "arnamak/stay-centered.nvim"

  use {
    "akinsho/toggleterm.nvim",
    tag = '*'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
