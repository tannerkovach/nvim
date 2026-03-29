vim.pack.add({
  "https://github.com/briangwaltney/paren-hint.nvim",
})

require("paren-hint").setup({
  include_paren = true,
  anywhere_on_line = true,
  show_same_line_opening = false,
  highlight = "Comment",
  excluded_filetypes = {
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "gitcommit",
    "TelescopePrompt",
    "TelescopeResults",
    "",
  },
  excluded_buftypes = {
    "terminal",
    "nofile",
    "quickfix",
    "prompt",
  },
})
