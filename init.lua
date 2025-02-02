--  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

-- ╭──────────────────────────────────────────────────────────╮
-- │                     Global Options                       │
-- ╰──────────────────────────────────────────────────────────╯

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- ╭──────────────────────────────────────────────────────────╮
-- │                     Local Options                        │
-- ╰──────────────────────────────────────────────────────────╯

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.list = true
vim.opt.listchars = { tab = '▏ ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.o.scrolloff = 5
vim.opt.laststatus = 3
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.sidescroll = 1
vim.o.cmdheight = 0
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0

-- ╭──────────────────────────────────────────────────────────╮
-- │                     Keymaps Options                      │
-- ╰──────────────────────────────────────────────────────────╯

local keymap = vim.keymap.set

-- NOTE: General Keymaps

keymap('n', '<C-b>', '<C-^>', { desc = 'Alternate Buffer' })
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap('x', 'y', 'mmy`m')
keymap('n', '<C-CR>', 'm`o<Esc>``')
keymap('n', '<M-CR>', 'm`O<Esc>``')
keymap('n', '<CR>', 'o<ESC>')
keymap('n', '<S-CR>', 'O<ESC>')
keymap('x', 'p', 'P', { silent = true })
keymap('n', 'R', '<C-r>')
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap('n', 'FF', ':w<CR>', { noremap = true, silent = true })
keymap('n', 'YY', ':%y<CR>', { noremap = true, silent = true })
keymap('n', 'QQ', function()
  vim.cmd 'wa!'
  vim.cmd 'qa!'
end, { silent = true })

-- NOTE: Window Management

-- Splits
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' })
keymap('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tabs
keymap('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap('n', '<M-b>', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap('n', '<C-e>', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap('t', '<M-b>', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap('t', '<C-e>', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- Buffers
keymap('n', '<leader>fn', ':bnext<CR>', { desc = 'Next Buffer' })
keymap('n', '<leader>fp', ':bprev<CR>', { desc = 'Prev Buffer' })
keymap('n', '<leader>fx', ':bdelete<CR>', { desc = 'Delete Buffer' })

-- Terminal Buffers
keymap('t', '<C-S-t>', function()
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end, { desc = 'New Terminal' })

keymap('t', '<C-t>', '<cmd>BufTermNext<CR>', { desc = 'Next Terminal Buffer' })
keymap('t', '<C-p>', '<cmd>BufTermPrev<CR>', { desc = 'Next Terminal Buffer' })
keymap('n', '<C-t>', '<cmd>BufTermNext<CR>', { desc = 'Next Terminal Buffer' })
keymap('n', '<C-p>', '<cmd>BufTermPrev<CR>', { desc = 'Next Terminal Buffer' })

keymap('t', '<C-Left>', function()
  vim.cmd.wincmd 'h'
end, { noremap = true, silent = true })
keymap('t', '<C-Right>', function()
  vim.cmd.wincmd 'l'
end, { noremap = true, silent = true })
keymap('t', '<C-Down>', function()
  vim.cmd.wincmd 'j'
end, { noremap = true, silent = true })
keymap('t', '<C-Up>', function()
  vim.cmd.wincmd 'k'
end, { noremap = true, silent = true })

keymap('n', '<C-Left>', function()
  vim.cmd.wincmd 'h'
end, { noremap = true, silent = true })
keymap('n', '<C-Right>', function()
  vim.cmd.wincmd 'l'
end, { noremap = true, silent = true })
keymap('n', '<C-Down>', function()
  vim.cmd.wincmd 'j'
end, { noremap = true, silent = true })
keymap('n', '<C-Up>', function()
  vim.cmd.wincmd 'k'
end, { noremap = true, silent = true })

-- -- NOTE: Terminal Management

local function is_term_buffer(bufnr)
  return vim.bo[bufnr].buftype == 'terminal'
end

local function get_term_buffers()
  local term_bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if is_term_buffer(buf) then
      table.insert(term_bufs, buf)
    end
  end
  return term_bufs
end

local function find_term_window()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if is_term_buffer(buf) then
      return win
    end
  end
  return nil
end

local function delete_current_term()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Only proceed if this is actually a terminal buffer
  if not is_term_buffer(current_buf) then
    return
  end

  -- Get all terminal buffers
  local term_bufs = get_term_buffers()

  -- Remove current buffer from the list
  for i, buf in ipairs(term_bufs) do
    if buf == current_buf then
      table.remove(term_bufs, i)
      break
    end
  end

  -- If there are other terminal buffers, switch to the next one before deleting
  if #term_bufs > 0 then
    -- Get all windows showing the current buffer
    local windows = vim.fn.win_findbuf(current_buf)

    -- Switch each window to the next terminal buffer
    for _, win in ipairs(windows) do
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_buf(win, term_bufs[1])
      end
    end
  end

  -- Delete the current buffer
  vim.api.nvim_buf_delete(current_buf, { force = true })
end

local function create_term()
  vim.cmd.new()
  vim.cmd.term()
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd.startinsert()

  -- Create autocommand for this specific buffer
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_create_autocmd('BufEnter', {
    buffer = bufnr,
    callback = function()
      vim.cmd.startinsert()
    end,
  })
end

local function toggle_term()
  local term_win = find_term_window()
  local term_bufs = get_term_buffers()

  if term_win then
    -- Terminal window exists, hide it
    pcall(vim.api.nvim_win_close, term_win, true)
  else
    -- No terminal window visible
    if #term_bufs > 0 then
      -- Reuse existing terminal buffer
      vim.cmd.new()
      vim.api.nvim_win_set_height(0, 15)
      vim.api.nvim_win_set_buf(0, term_bufs[1])
      vim.cmd.startinsert()
    else
      -- Create new terminal if none exist
      create_term()
    end
  end
end

-- Map keys for terminal management
keymap('t', '<C-d>', delete_current_term, { noremap = true, silent = true })
keymap('n', '<C-S-t>', create_term, { noremap = true, silent = true })
keymap('n', '<C-/>', toggle_term, { noremap = true, silent = true })
keymap('t', '<C-/>', toggle_term, { noremap = true, silent = true })

-- NOTE: Formatting

keymap('n', '<leader>ff', function()
  require('conform').format()
end, { desc = 'Format buffer' })

-- NOTE: Plugin Keymaps

keymap('n', '<leader>ta', '<cmd>AvanteToggle<CR>', { desc = 'Toggle Oil.nvim' })

-- Oil.nvim
keymap('n', '-', '<cmd>Oil<CR>', { desc = 'Toggle Oil.nvim' })

-- MiniDiff
keymap('n', '<leader>dt', function()
  MiniDiff.toggle_overlay()
end, { desc = 'Toggle diff overlay' })

-- CodeCompanion
keymap('n', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
keymap('v', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
keymap('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
keymap('v', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
keymap('n', '<leader>cn', '<cmd>CodeCompanionChat<cr>', { noremap = true, silent = true })
keymap('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

vim.cmd [[cab cc CodeCompanion]]

keymap('n', '<leader>.', function()
  local neogit_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match 'Neogit' then
      neogit_win = win
      break
    end
  end
  if neogit_win then
    vim.api.nvim_win_close(neogit_win, true)
  else
    vim.cmd 'Neogit'
  end
end)

-- NOTE: Diagnostics

keymap('n', '<leader>yt', function()
  virtual_text_enabled = not virtual_text_enabled
  vim.diagnostic.config {
    virtual_text = virtual_text_enabled,
  }
end)
keymap('n', '<leader>yd', function()
  vim.diagnostic.config {
    virtual_text = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    signs = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    underline = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
  }
end)
keymap('n', '<leader>yh', function()
  vim.diagnostic.config {
    virtual_text = {
      severity = { min = vim.diagnostic.severity.HINT },
    },
    signs = {
      severity = { min = vim.diagnostic.severity.HINT },
    },
    underline = {
      severity = { min = vim.diagnostic.severity.HINT },
    },
  }
end)

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Autocommands Options                    │
-- ╰──────────────────────────────────────────────────────────╯

vim.cmd 'autocmd BufEnter * set formatoptions-=cro'
vim.cmd 'autocmd BufEnter * setlocal formatoptions-=cro'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*.md',
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Lazy Plugin Manager                     │
-- ╰──────────────────────────────────────────────────────────╯

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- 'tpope/vim-sleuth',
  'tpope/vim-repeat',

  { 'junegunn/fzf', build = './install --bin' },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            n = {
              ['<c-d>'] = require('telescope.actions').delete_buffer,
              ['<esc>'] = require('telescope.actions').close,
            },
            i = {
              ['<c-d>'] = require('telescope.actions').delete_buffer,
              ['<esc>'] = require('telescope.actions').close,
            },
          },
          borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          file_ignore_patterns = {
            'node_modules',
          },
        },
        pickers = {
          live_grep = {
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
              '--fixed-strings', -- this disables regex
              '--smart-case',
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  {
    'Bilal2453/luvit-meta',
    lazy = true,
  },

  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            client.server_capabilities.documentHighlightProvider = false
          end
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      if vim.g.have_nerd_font then
        local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
        local diagnostic_signs = {}
        for type, icon in pairs(signs) do
          diagnostic_signs[vim.diagnostic.severity[type]] = icon
        end
        vim.diagnostic.config { signs = { text = diagnostic_signs } }
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, liquid = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- javascript = { 'prettier' },
        -- liquid = { 'prettier' },
        html = { 'prettier' },
      },
    },
  },
  --
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    priority = 1000,
    init = function()
      vim.cmd 'colorscheme vscode'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup {
        mappings = {
          add = '<leader>xa',
          delete = '<leader>xx',
          find = '<leader>xf',
          find_left = '<leader>xF',
          highlight = '<leader>xh',
          replace = '<leader>xr',
          update_n_lines = '<leader>xn',

          suffix_last = 'l',
          suffix_next = 'n',
        },
      }
      require('mini.move').setup()
      require('mini.files').setup {
        content = {
          filter = nil,
          prefix = nil,
          sort = nil,
        },

        mappings = {
          close = 'q',
          go_in = '+',
          go_in_plus = 'L',
          go_out = '-',
          go_out_plus = 'H',
          mark_goto = "'",
          mark_set = 'm',
          reset = '<BS>',
          reveal_cwd = '@',
          show_help = 'g?',
          synchronize = '=',
          trim_left = '<',
          trim_right = '>',
        },

        options = {
          permanent_delete = true,
          use_as_default_explorer = true,
        },

        windows = {
          max_number = math.huge,
          preview = false,
          width_focus = 40,
          width_nofocus = 40,
          width_preview = 25,
        },
      }
      require('mini.diff').setup {
        -- Options for how hunks are visualized
        view = {
          style = vim.go.number and 'number' or 'sign',
          priority = 199,
        },
        source = nil,
        delay = {
          text_change = 200,
        },
        mappings = {
          -- Apply hunks inside a visual/operator region
          apply = 'gh',

          -- Reset hunks inside a visual/operator region
          reset = 'gH',

          -- Hunk range textobject to be used inside operator
          -- Works also in Visual mode if mapping differs from apply and reset
          textobject = 'gh',

          -- Go to hunk range in corresponding direction
          goto_first = '[H',
          goto_prev = '[h',
          goto_next = ']h',
          goto_last = ']H',
        },

        -- Various options
        options = {
          -- Diff algorithm. See `:h vim.diff()`.
          algorithm = 'histogram',

          -- Whether to use "indent heuristic". See `:h vim.diff()`.
          indent_heuristic = true,

          -- The amount of second-stage diff to align lines (in Neovim>=0.9)
          linematch = 60,

          -- Whether to wrap around edges during hunk navigation
          wrap_goto = false,
        },
      }
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'liquid', 'javascript' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  {
    import = 'plugins',
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
    },
  },
})
