vim.pack.add({
  "https://github.com/serhez/bento.nvim",
})

require("bento").setup({
  ui = {
    mode = "tabline",
  },
})
