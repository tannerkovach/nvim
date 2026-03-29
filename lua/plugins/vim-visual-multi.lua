vim.g.VM_default_mappings = 0

vim.pack.add({
  "https://github.com/mg979/vim-visual-multi",
})

vim.keymap.set("n", "<C-S-Down>", "<Plug>(VM-Select-Cursor-Down)")
vim.keymap.set("n", "<C-S-Up>", "<Plug>(VM-Select-Cursor-Up)")
