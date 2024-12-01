return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {},
  config = function()
    -- local hooks = require "ibl.hooks"
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --   vim.api.nvim_set_hl(0, "IblIndent", { fg = "NvimLightGrey4"})
    -- end)

    require('ibl').setup {
      indent = {
        char = '▏', -- This character determines the width
        -- highlight = "IblIndent"
      },
    }
  end,
}
