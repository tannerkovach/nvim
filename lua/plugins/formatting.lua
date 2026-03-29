vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
