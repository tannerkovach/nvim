return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = function ()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
        agent = {
          adapter = "anthropic",
        },
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "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"
            },
          })
        end,
      },
      display = {
        diff = {
          provider = "mini_diff",
        },
      }
    })
  end
}
