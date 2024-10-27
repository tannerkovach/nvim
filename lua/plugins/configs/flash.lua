return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = true
      }
    }
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }
  },
  config = function ()
    vim.api.nvim_set_hl(0, 'FlashLabel', { bg='NvimLightGreen'})
  end
}
