return {
  'briangwaltney/paren-hint.nvim',
  lazy = false,
  config = function()
    require('paren-hint').setup {
      include_paren = true,
      anywhere_on_line = true,
      show_same_line_opening = false,
      highlight = 'Comment',

      -- excluded filetypes
      excluded_filetypes = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'man',
        'gitcommit',
        'TelescopePrompt',
        'TelescopeResults',
        '',
      },
      -- excluded buftypes
      excluded_buftypes = {
        'terminal',
        'nofile',
        'quickfix',
        'prompt',
      },
    }
  end,
}
