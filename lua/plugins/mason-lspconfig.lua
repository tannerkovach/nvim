return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason-lspconfig').setup({
      -- LSP servers to auto-install
      ensure_installed = {
        'lua_ls',
        'tailwindcss',
      },
      -- Auto-install LSP servers when you open a file
      automatic_installation = true,
      -- Setup LSP servers automatically
      handlers = {
        -- Default handler for all servers
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        -- Custom handler for lua_ls
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
