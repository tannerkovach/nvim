return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>ue', "<cmd>lua require('undotree').toggle()<cr>" },
  },
  opts = {
    float_diff = true, -- using float window previews diff, set this `true` will disable layout option
    layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
    position = 'left', -- "right", "bottom"
    ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
    window = {
      winblend = 0,
    },
    keymaps = {
      ['<C-S-Down>'] = 'move_next',
      ['<C-S-Up>'] = 'move_prev',
      ['gj'] = 'move2parent',
      ['<M-S-Down>'] = 'move_change_next',
      ['<M-S-Up>'] = 'move_change_prev',
      ['<cr>'] = 'action_enter',
      ['p'] = 'enter_diffbuf',
      ['q'] = 'quit',
    },
  },
}
