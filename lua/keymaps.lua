vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- use similar bindings to tmux
vim.keymap.set('n', '<leader>%', ':vsplit<CR>', { desc = 'vsplit' })
vim.keymap.set('n', '<leader>"', ':split<CR>', { desc = 'split' })

vim.keymap.set('n', '<leader>ex', ':Explore<CR>', { desc = "e[x]plore" } )
vim.keymap.set('n', '<leader>es', ':Sexplore<CR>', { desc = "[s]plit explore"} )
vim.keymap.set('n', '<leader>ev', ':Vexplore<CR>', { desc = "[v]split expore"} )

-- Keymaps from kickstart
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
