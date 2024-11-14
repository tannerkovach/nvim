local keymap = vim.keymap.set

-- Basic keymaps
keymap('x', 'p', 'P', { silent = true })
keymap('n', 'R', '<C-r>')
keymap('n', 'SS', ':w<CR>', { noremap = true, silent = true })
keymap('n', 'YY', ':%y<CR>', { noremap = true, silent = true })
keymap('n', 'VV', 'ggVG', { noremap = true, silent = true })
keymap('n', 'DD', 'ggVGd', { noremap = true, silent = true })
keymap('n', 'QQ', '<cmd>qa<CR>', { noremap = true, silent = true })

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
keymap('n', '<leader>g', function()
  local neogit_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match("Neogit") then
      neogit_win = win
      break
    end
  end
  if neogit_win then
    vim.api.nvim_win_close(neogit_win, true)
  else
    vim.cmd('Neogit')
  end
end)

keymap('n', '<leader>dt', function()
  MiniDiff.toggle_overlay()
end, { desc = 'Toggle diff overlay' })

keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
keymap("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
keymap("v", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
