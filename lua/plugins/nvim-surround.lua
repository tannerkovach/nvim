return {
  'kylechui/nvim-surround',
  version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {
      -- keymaps = {
      --   normal = "gs",
      --   normal_cur = "gss",
      --   normal_line = "gS",
      --   normal_cur_line = "gSS",
      --   visual = "gS",
      --   delete = "gds",
      --   change = "gcs",
      -- },     -- Configuration here, or leave empty to use defaults
    }
  end,
}
