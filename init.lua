-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'no'
vim.opt.list = true
vim.opt.listchars = { tab = '▏ ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.o.scrolloff = 5
vim.o.laststatus = 3
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.sidescroll = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.opt.autoread = true

local keymap = vim.keymap.set

-- Keymaps
keymap('n', '<C-b>', '<C-^>')
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap('x', 'y', 'mmy`m')
keymap('n', '<CR>', 'o<ESC>')
keymap('x', 'p', 'P', { silent = true })
keymap('n', 'p', ':pu<CR>', { silent = true })
keymap('n', 'R', '<C-r>')
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap('n', '<Up>', 'gk')
keymap('n', '<Down>', 'gj')
keymap('n', 'u', '<Nop>', { silent = true })
keymap('n', '<S-u>', 'u', { silent = true })

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

-- Split Keymaps
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' })
keymap('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
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

-- Tab Keymaps
keymap('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- Buffer Keymaps
keymap('n', '<leader>fn', ':bnext<CR>', { desc = 'Next Buffer' })
keymap('n', '<leader>fp', ':bprev<CR>', { desc = 'Prev Buffer' })
keymap('n', '<leader>fx', ':bd!<CR>', { desc = 'Delete Buffer' })

-- DiffView Keymaps
keymap({ 'n' }, '<leader>do', ':DiffviewOpen<CR>')
keymap({ 'n' }, '<leader>dc', ':DiffviewClose<CR>')
keymap({ 'n' }, '<leader>dh', ':DiffviewFileHistory<CR>')
keymap({ 'n' }, '<leader>ds', ':DiffviewToggleFiles<CR>')

-- Oil Keymaps
keymap('n', '-', '<cmd>Oil<CR>', { desc = 'Toggle Oil.nvim' })

-- MiniDiff Keymaps
keymap('n', '<leader>dt', function()
  MiniDiff.toggle_overlay()
end, { desc = 'Toggle diff overlay' })

-- NvimSurround Keymaps
keymap('n', 'Dst', '<Plug>(nvim-surround-delete)tdd}dd<C-o>')

-- Neogit Keymaps
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

-- Auto Commands
vim.api.nvim_create_autocmd('FileType', { -- Sets conceallevel for Obsidian plugin
  pattern = 'markdown',
  callback = function()
    vim.opt.conceallevel = 2
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#2e5e00', bg = '#80ffb8', bold = true })
  end,
})

vim.cmd 'autocmd BufEnter * set formatoptions-=cro' -- Disable Neovim comment continuation

-- LSP
vim.lsp.enable('lua_ls')
vim.lsp.enable('tailwindcss')

-- Lazy Plugin
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
  import = 'plugins',
}, {})
