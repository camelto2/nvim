local req = function(plugin) 
  require('plugin_config.'..plugin)
end

req('lualine')
req('onedark')
req('treesitter')
req('fugitive')
req('gitsigns')
req('which-key')
req('neodev')
req('fidget')
req('telescope')
req('all-lsp-plugins')
req('nvim-cmp')
req('vimtex')
req("neorg")
req("stay-centered")
