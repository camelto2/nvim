vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = "[g]it fu[g]itive buffer"} )
vim.keymap.set('n', '<leader>gs', ':Git status -uno<CR>', { desc = "[g]it [s]tatus" } )
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = "[g]it [l]og"} )
vim.keymap.set('n', '<leader>ga', ':Git add ', { desc = "[g]it [a]dd" } )
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = "[g]it [c]ommit" } )
vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', { desc = "[g]it [d]iff" } )
vim.keymap.set('n', '<leader>gf', ':Git fetch ', { desc = "[g]it [f]etch"} )
vim.keymap.set('n', '<leader>gm', ':Git merge ', { desc = "[g]it [m]erge"} )
vim.keymap.set('n', '<leader>gp', ':Git push ', { desc = "[g]it [p]ush"} )
vim.keymap.set('n', '<leader>go', ':Git checkout ', { desc = "[g]it check[o]ut"} )
vim.keymap.set('n', '<leader>gb', ':Git branch', { desc = "[g]it [b]ranch"} )
