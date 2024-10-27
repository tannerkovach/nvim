local keymap = vim.keymap.set

-- Basic keymaps
keymap('x', 'p', 'P', { silent = true })
keymap('n', 'R', '<C-r>')
keymap('n', 'SS', ':w<CR>', { noremap = true, silent = true })
keymap('n', 'YY', ':%y<CR>', { noremap = true, silent = true })
keymap('n', 'VV', 'ggVG', { noremap = true, silent = true })
keymap('n', 'DD', 'ggVGd', { noremap = true, silent = true })

-- Window management
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' })
keymap('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tab management
keymap('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

keymap('n', '<leader>on', ':ObsidianNew<CR>')
keymap('n', '<leader>g', '<cmd>Neogit<CR>')
