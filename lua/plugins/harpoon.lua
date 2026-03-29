vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/theprimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon file" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon quick menu" })
vim.keymap.set("n", "<leader>n", function() harpoon:list():select(1) end, { desc = "harpoon to file 1" })
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(2) end, { desc = "harpoon to file 2" })
vim.keymap.set("n", "<leader>i", function() harpoon:list():select(3) end, { desc = "harpoon to file 3" })
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(4) end, { desc = "harpoon to file 4" })
