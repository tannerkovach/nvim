vim.pack.add({
  "https://github.com/christoomey/vim-tmux-navigator",
})

vim.keymap.set("n", "<c-Left>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-Down>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-Up>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-Right>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")
