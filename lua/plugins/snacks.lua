return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3500,
    },
    quickfile = { enabled = true },
    -- statuscolumn = {
    --   enabled = true,
    --   left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
    --   right = { 'fold', 'git' }, -- priority of signs on the right (high to low)
    --   folds = {
    --     open = true, -- show open fold icons
    --     git_hl = true, -- use Git Signs hl for fold icons
    --   },
    --   git = {
    --     -- patterns to match Git signs
    --     patterns = { 'GitSign', 'MiniDiffSign' },
    --   },
    --   refresh = 50, -- refresh at most every 50ms
    -- },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    scroll = { enabled = false },
    indent = { enabled = true },
    -- animate = {
    --   duration = 20, -- ms per step
    --   easing = 'linear',
    --   fps = 60, -- frames per second. Global setting for all animations
    -- },
  },
  keys = {
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },
    {
      '<leader>sb',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>sB',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    {
      '<leader>ynh',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    {
      '<leader>cR',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>yn',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ys'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>yw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>yl'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>yb'
        Snacks.toggle.inlay_hints():map '<leader>yi'
      end,
    })
  end,
}
