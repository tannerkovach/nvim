vim.pack.add({
  "https://github.com/echasnovski/mini.nvim",
})

require("mini.ai").setup({ n_lines = 500 })
require("mini.move").setup({
  mappings = {
    left = "<M-S-Left>",
    right = "<M-S-right>",
    up = "<M-S-Up>",
    down = "<M-S-Down>",
    line_left = "<M-S-Left>",
    line_right = "<M-S-right>",
    line_up = "<M-S-Up>",
    line_down = "<M-S-Down>",
  },
})
require("mini.splitjoin").setup({
  mappings = {
    toggle = "<localleader>s",
    split = "",
    join = "",
  },
})
require("mini.cursorword").setup()
require("mini.diff").setup({
  view = {
    style = vim.go.number and "number" or "sign",
    priority = 199,
  },
  source = nil,
  delay = {
    text_change = 200,
  },
  mappings = {
    apply = "gh",
    reset = "gH",
    textobject = "gh",
    goto_first = "g<Up>",
    goto_prev = "g<Right>",
    goto_next = "g<Left>",
    goto_last = "g<Down>",
  },
  options = {
    algorithm = "histogram",
    indent_heuristic = true,
    linematch = 60,
    wrap_goto = false,
  },
})
require("mini.statusline").setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location = MiniStatusline.section_location({ trunc_width = 120 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { filename } },
        "%<",
        "%=",
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = "MiniStatuslineLocation", strings = { location } },
      })
    end,
  },
})

require("mini.sessions").setup({
  autoread = false,
  autowrite = true,
  directory = vim.fn.stdpath("data") .. "/sessions",
  file = "Session.vim",
  force = { read = false, write = true, delete = false },
  hooks = {
    pre = { read = nil, write = nil, delete = nil },
    post = { read = nil, write = nil, delete = nil },
  },
  verbose = { read = false, write = true, delete = true },
})

vim.keymap.set("n", "<leader>sS", function()
  local name = vim.fn.input("Session name: ")
  if name ~= "" then
    require("mini.sessions").write(name)
  end
end, { desc = "Save session" })

vim.keymap.set("n", "<leader>sL", function()
  require("mini.sessions").select("read")
end, { desc = "Load session" })

vim.keymap.set("n", "<leader>sD", function()
  require("mini.sessions").select("delete")
end, { desc = "Delete session" })

vim.keymap.set("n", "<leader>sC", function()
  require("mini.sessions").write()
end, { desc = "Save current session" })
