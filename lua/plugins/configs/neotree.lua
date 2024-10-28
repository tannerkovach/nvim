return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>,', ':Neotree toggle<CR>', { desc = 'NeoTree reveal', nowait = true } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>o'] = 'close_window',
        },
      },
    },
  },
  config = {
    popup_border_style = "single",
  }
}
