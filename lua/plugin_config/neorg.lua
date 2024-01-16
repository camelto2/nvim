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
          playground = "~/neorg/playground",
          norg = "~/neorg"
        },
        default_workspace = 'norg',
      },
    },
  },
})

vim.keymap.set('n', '<leader>ni', ':Neorg index<CR>', { desc = "[N]eorg [I]ndex"})
vim.keymap.set('n', '<leader>nw', ':Neorg workspace ', { desc = "[N]eorg [W]orkspace"})
vim.keymap.set('n', '<leader>njto', ':Neorg journal toc open<CR>', { desc = "[N]eorg [J]ournal [T]OC [O]pen"})
vim.keymap.set('n', '<leader>njtu', ':Neorg journal toc update<CR>', { desc = "[N]eorg [J]ournal [T]OC [U]pdate"})
