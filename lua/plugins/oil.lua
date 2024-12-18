return {
  -- 'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  --   'nvim-tree/nvim-web-devicons',
  --   'MunifTanjim/nui.nvim',
  -- },
  -- cmd = 'Neotree',
  -- keys = {
  --   { '<leader>,', ':Neotree toggle<CR>', { desc = 'NeoTree reveal', nowait = true } },
  -- },
  -- opts = {
  --   close_if_last_window = true,
  --   popup_border_style = 'single',
  --   filesystem = {
  --     -- filtered_items = {
  --     --   visible = true,
  --     --   hide_dotfiles = false,
  --     --   hide_gitignored = false,
  --     --   hide_by_name = {
  --     --     'node_modules',
  --     --   },
  --     -- },
  --     window = {
  --       mappings = {
  --         ['<leader>o'] = 'close_window',
  --       },
  --     },
  --   },
  -- },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}
