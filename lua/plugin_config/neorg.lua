require("neorg").setup({
  load = {
    ["core.defaults"] = {},  -- loads default behvaior
    ["core.concealer"] = {}, -- adds pretty icons to your documents
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


