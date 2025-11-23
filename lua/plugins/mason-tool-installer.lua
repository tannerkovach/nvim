return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-tool-installer').setup({
      ensure_installed = {
        -- Formatters (used by conform.nvim)
        'stylua', -- Lua formatter
        'prettier', -- JS/TS/HTML/CSS/JSON formatter

        -- Add other formatters, linters, or DAP servers here as needed
        -- Examples:
        -- 'eslint_d', -- JS/TS linter
        -- 'black', -- Python formatter
        -- 'isort', -- Python import sorter
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
