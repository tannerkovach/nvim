---@diagnostic disable: missing-fields

return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-lua/plenary.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'stevearc/dressing.nvim', opts = {} },
    { 'nvim-telescope/telescope.nvim' },
  },
  opts = {
    strategies = {
      chat = { adapter = 'anthropic' },
      inline = { adapter = 'anthropic' },
    },
    opts = {
      log_level = 'DEBUG',
    },
    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = vim.env.ANTHROPIC_API_KEY,
          },
        })
      end,
    },
  },
}
