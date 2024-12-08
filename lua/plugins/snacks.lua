return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { example = 'compact_files' },
    notifier = {
      enabled = true,
      timeout = 3000,
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
    toggle = {
      map = vim.keymap.set, -- keymap.set function to use
      which_key = false, -- integrate with which-key to show enabled/disabled icons and colors
      notify = true, -- show a notification when toggling
      -- icons for enabled/disabled states
      icon = {
        enabled = ' ',
        disabled = ' ',
      },
      -- colors for enabled/disabled states
      color = {
        enabled = 'green',
        disabled = 'yellow',
      },
    },
    terminal = {
      win = {
        style = 'float',
        width = 0.8, -- 80% of screen width
        height = 0.8, -- 80% of screen height
        border = 'rounded',
        title = ' Terminal ',
      },
    },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      '<leader>/',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    -- {
    --   '<leader>nh',
    --   function()
    --     Snacks.notifier.show_history()
    --   end,
    --   desc = 'Notification History',
    -- },
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
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<C-/>',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle Terminal',
    },
    -- {
    --   '<c-_>',
    --   function()
    --     Snacks.terminal()
    --   end,
    --   desc = 'which_key_ignore',
    -- },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    {
      '<leader>N',
      desc = 'Neovim News',
      function()
        Snacks.win {
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        }
      end,
    },
    {
      '<leader>T',
      desc = 'Toggle',
      function()
        Snacks.toggle()
      end,
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
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>ul'
        -- Snacks.toggle.diagnostics():map '<leader>ud'
        -- Snacks.toggle.line_number():map '<leader>ul'
        -- Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        -- Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        -- Snacks.toggle.inlay_hints():map '<leader>uh'
      end,
    })
  end,
}
