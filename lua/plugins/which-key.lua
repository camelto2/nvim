-- not sure why I have these set?
vim.opt.timeout = true
vim.opt.timeoutlen = 300

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {"<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {"<leader>g", 
     function()
       require("which-key").show({global = false})
     end,
     desc = "[G]it"
    },
    {"<leader>s",
     function()
       require("which-key").show({global = false})
     end,
     desc = "[S]earch"
    }
  },
}

