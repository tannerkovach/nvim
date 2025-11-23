return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    local copilot = require("copilot")
    copilot.setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        ["*"] = true,
        gitcommit = true,
        gitrebase = true,
        markdown = true,
      },
      copilot_node_command = "node",
      server_opts_overrides = {},
    })

    -- Set up custom Tab mapping
    vim.keymap.set("i", "<Tab>", function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { desc = "Accept Copilot suggestion or Tab" })
  end,
}
