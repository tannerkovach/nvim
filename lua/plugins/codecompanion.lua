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
            api_key = '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',
          },
        })
      end,
    },
  },
}
