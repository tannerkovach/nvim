return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<C-n>'] = {
        function(cmp)
          return true 
        end,
      },
      ['<C-y>'] = { 'accept', 'fallback' },
      ['<Right>'] = { 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev' },
      ['<Down>'] = { 'select_next' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
