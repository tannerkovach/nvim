local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- Check if we've already run ObsidianNew in this buffer
    if vim.b.obsidian_new_ran then
      return
    end

    -- Exclude non-normal buffers (like Telescope, help, terminal, etc.)
    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buftype ~= '' then
      return
    end

    -- Exclude buffers with a filetype already set
    local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
    if filetype ~= '' then
      return
    end

    -- Get the buffer name
    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname == '' then
      -- Expand and normalize the current working directory
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p')
      -- Expand and normalize your notes directory path
      local notes_dir = vim.fn.fnamemodify(vim.fn.expand('~/Documents/Notes'), ':p')

      -- Check if the current directory is your notes directory or a subdirectory
      if string.sub(cwd, 1, string.len(notes_dir)) == notes_dir then
        -- Mark that we have run ObsidianNew in this buffer
        vim.b.obsidian_new_ran = true
        -- Execute the :ObsidianNew command
        vim.cmd('ObsidianNew')
        vim.opt.filetype = 'markdown'
      end
    end
  end
})


vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.conceallevel = 1

vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.cursorline = true
-- vim.opt.background="light" // re-add if I swap back to default

vim.keymap.set('x', 'p', 'P', { silent = true })
vim.keymap.set('n', 'R', '<C-r>')

vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>')

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

vim.keymap.set('n', '<leader>g', '<cmd>Neogit<CR>')

vim.keymap.set('n', 'SS', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'YY', ':%y<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'VV', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('n', 'DD', 'ggVGd', { noremap = true, silent = true })

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

require("lazy").setup({
  spec = {

    -- PICKER
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function() 
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
      end
    },


    -- COLORSCHEMES
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000
    },

    {
      "rose-pine/neovim",
      name = "rose-pine"
    },


    -- TREESITTER
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
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
      config = function(_, opts)
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)
      end,
    },

    -- MULTICURSOR
    {
      'mg979/vim-visual-multi'
    },

    -- INDENT LINES
    {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = {},
      config = function()
        -- local hooks = require "ibl.hooks"
        -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        --   vim.api.nvim_set_hl(0, "IblIndent", { fg = "NvimLightGrey4"})
        -- end)

        require("ibl").setup {
          indent = {
            char = "▏", -- This character determines the width
            -- highlight = "IblIndent"
          }
        }
      end
    },

    -- SURROUND, MOVE LINES
    {
      'echasnovski/mini.nvim',
      config = function()
        require('mini.ai').setup { n_lines = 500 }
        require('mini.surround').setup {
          mappings = {
            add = 'tsa',
            delete = 'tsd',
            find = 'tsf',
            find_left = 'tsF',
            highlight = 'tsh',
            replace = 'tsr',
            update_n_lines = 'tsn',

            suffix_last = 'l',
            suffix_next = 'n',
          }
        }
        require('mini.move').setup {}

        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = vim.g.have_nerd_font }

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
          return '%2l:%-2v'
        end
      end,
    },

    -- NAVIGATION
    {
      'folke/flash.nvim',
      event = 'VeryLazy',
      ---@type Flash.Config
      opts = {
        modes = {
          search = {
            enabled = true
          }
        }
      },
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }
      },
      config = function ()
        vim.api.nvim_set_hl(0, 'FlashLabel', { fg='#000000', bg='NvimLightGreen'})
      end
    },

    {
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
    },

    {
      'chaoren/vim-wordmotion',
    },

    -- NOTES
    {
      "epwalsh/obsidian.nvim",
      version = "*",
      lazy = false,
      ft = "markdown",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {
        workspaces = {
          {
            name = "personal",
            path = "~/Documents/Notes",
          }
        },
        templates = {
          folder = "templates"
        }
      }
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        {
          'L3MON4D3/LuaSnip',
          build = (function()
            -- Build Step is needed for regex support in snippets
            -- This step is not supported in many windows environments
            -- Remove the below condition to re-enable on windows
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
              return
            end
            return 'make install_jsregexp'
          end)(),
        },
        'saadparwaiz1/cmp_luasnip',

        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are split
        --  into multiple repos for maintenance purposes.
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',

        -- If you want to add a bunch of pre-configured snippets,
        --    you can use this plugin to help you. It even has snippets
        --    for various frameworks/libraries/etc. but you will have to
        --    set up the ones that are useful for you.
        -- 'rafamadriz/friendly-snippets',
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

            -- -- Accept ([y]es) the completion.
            -- --  This will auto-import if your LSP supports it.
            -- --  This will expand snippets if the LSP sent a snippet.
            -- ['<C-y>'] = cmp.mapping.confirm { select = true },
            --
            -- -- Manually trigger a completion from nvim-cmp.
            -- --  Generally you don't need this, because nvim-cmp will display
            -- --  completions whenever it has completion options available.
            -- ['<C-Space>'] = cmp.mapping.complete {},

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

            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                if luasnip.expandable() then
                  luasnip.expand()
                else
                  cmp.confirm {
                    select = true,
                  }
                end
              elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, { 'i', 's' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' }
          },
        }
      end,
    },


    -- LSP
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },

        -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        { 'folke/neodev.nvim', opts = {} },
      },
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
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
            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
              end, '[T]oggle Inlay [H]ints')
            end
          end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
          lua_ls = {
            -- cmd = {...},
            -- filetypes = { ...},
            -- capabilities = {},
            settings = {
              Lua = {
                {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          },
        }

        require('mason').setup()

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

    -- GIT/DIFF TOOL
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "echasnovski/mini.pick",         -- optional
      },
      config = true
    },

    {
      "sindrets/diffview.nvim"
    }

  },
  install = { },
  checker = { enabled = true },
})

vim.cmd("colorscheme rose-pine-main")
