return {
  'echasnovski/mini.nvim',
  config = function()
    vim.cmd.colorscheme 'minispring'
    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#2e5e00', bg = '#80ffb8', bold = true })

    require('mini.ai').setup { n_lines = 500 }
    require('mini.move').setup {
      mappings = {
        left = '<M-S-Left>',
        right = '<M-S-right>',
        up = '<M-S-Up>',
        down = '<M-S-Down>',
        line_left = '<M-S-Left>',
        line_right = '<M-S-right>',
        line_up = '<M-S-Up>',
        line_down = '<M-S-Down>',
      },
    }
    require('mini.splitjoin').setup {
      mappings = {
        toggle = '<localleader>s',
        split = '',
        join = '',
      },
    }
    require('mini.cursorword').setup()
    require('mini.diff').setup {
      view = {
        style = vim.go.number and 'number' or 'sign',
        priority = 199,
      },
      source = nil,
      delay = {
        text_change = 200,
      },
      mappings = {
        apply = 'gh',
        reset = 'gH',
        textobject = 'gh',
        goto_first = 'g<Up>',
        goto_prev = 'g<Right>',
        goto_next = 'g<Left>',
        goto_last = 'g<Down>',
      },

      options = {
        algorithm = 'histogram',
        indent_heuristic = true,
        linematch = 60,
        wrap_goto = false,
      },
    }
    require('mini.statusline').setup {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
          local location = MiniStatusline.section_location { trunc_width = 120 }

          return MiniStatusline.combine_groups {
            { hl = mode_hl,                 strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { filename } },
            '%<',   -- Mark general truncate point
            '%=',   -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = 'MiniStatuslineLocation', strings = { location } },
          }
        end,
      },
    }
  end,
}
