return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup {
      mappings = {
        add = 'tsa',
        delete = 'tsd',
        find = 'tsf',
        find_left = 'tsF',
        highlight = 'tsh',
        replace = 'tsr',
        update_n_lines = 'tsn',

        suffix_last = 'l',
        suffix_next = 'n',
      }
    }
    require('mini.move').setup {}

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
