vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
  bigfile = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 4500,
  },
  words = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
  indent = {
    enabled = true,
    animate = {
      enabled = true,
    },
  },
})

vim.keymap.set("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })

-- _G.dd = function(...) Snacks.debug.inspect(...) end
-- _G.bt = function() Snacks.debug.backtrace() end
-- vim.print = _G.dd

Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>yw")
Snacks.toggle.inlay_hints():map("<leader>yi")
