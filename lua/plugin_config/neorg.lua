require("neorg").setup({
  load = {
    ["core.defaults"] = {},  -- loads default behvaior
    ["core.concealer"] = {   -- adds pretty icons to your documents
      config = {
        icon_preset = 'diamond',
      },
    },
    ["core.dirman"] = {      -- manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = 'notes',
      },
    },
  },
})

vim.keymap.set('n', '<leader>ni', ':Neorg index<CR>', { desc = "[N]eorg [I]ndex"})
vim.keymap.set('n', '<leader>nw', ':Neorg workspace ', { desc = "[N]eorg [W]orkspace"})
