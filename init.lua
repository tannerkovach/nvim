-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'auto'
vim.opt.list = true
vim.opt.listchars = { tab = '▏ ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.o.scrolloff = 20
vim.o.laststatus = 3
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.sidescroll = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.opt.autoread = true

-- Diagnostics
vim.diagnostic.config {
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  signs = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}

-- Keymaps
vim.keymap.set('n', '<C-b>', '<C-^>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('x', 'y', 'mmy`m')
vim.keymap.set('n', 'YY', 'mm^yg_`m')
vim.keymap.set('n', '<leader>p', 'a <ESC>p')
vim.keymap.set('n', 'R', '<C-r>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('n', 'u', '<Nop>', { silent = true })
vim.keymap.set('n', '<S-u>', 'u', { silent = true })

vim.keymap.set('n', '<leader>yt', function()
  local virtual_text_enabled
  virtual_text_enabled = not virtual_text_enabled
  vim.diagnostic.config {
    virtual_text = virtual_text_enabled,
  }
end)

-- Split Keymaps
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
vim.keymap.set('t', '<C-Left>', function()
  vim.cmd.wincmd 'h'
end, { noremap = true, silent = true })
vim.keymap.set('t', '<C-Right>', function()
  vim.cmd.wincmd 'l'
end, { noremap = true, silent = true })
vim.keymap.set('t', '<C-Down>', function()
  vim.cmd.wincmd 'j'
end, { noremap = true, silent = true })
vim.keymap.set('t', '<C-Up>', function()
  vim.cmd.wincmd 'k'
end, { noremap = true, silent = true })

-- Tab Keymaps
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- Buffer Keymaps
vim.keymap.set('n', '<leader>fn', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>fp', ':bprev<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>fx', ':bd!<CR>', { desc = 'Delete Buffer' })

-- DiffView Keymaps
vim.keymap.set({ 'n' }, '<leader>do', ':DiffviewOpen<CR>')
vim.keymap.set({ 'n' }, '<leader>dc', ':DiffviewClose<CR>')
vim.keymap.set({ 'n' }, '<leader>dh', ':DiffviewFileHistory<CR>')
vim.keymap.set({ 'n' }, '<leader>ds', ':DiffviewToggleFiles<CR>')

-- Oil Keymaps
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Toggle Oil.nvim' })

-- MiniDiff Keymaps
vim.keymap.set('n', '<leader>dt', function()
  MiniDiff.toggle_overlay()
end, { desc = 'Toggle diff overlay' })

-- Builtin Undotree Keymaps
vim.keymap.set("n", "<leader>ye", ":Undotree<CR>")

-- Neogit Keymaps
vim.keymap.set('n', '<leader>.', function()
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

vim.api.nvim_set_hl(0, 'YankHighlight', {
  bg = '#80ffb8',
  fg = '#2e5e00'
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank({
      higroup = 'YankHighlight',
      timeout = 150,
    })
  end,
})

local function colorscheme_autocmd_callback()
  vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#80ffb8', bg = '#2e5e00', bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = colorscheme_autocmd_callback,
})

colorscheme_autocmd_callback()

vim.cmd 'autocmd BufEnter * set formatoptions-=cro'

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  command = "checktime",
})

-- LSP
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('tailwindcss')

-- Plugins
vim.cmd("packadd nvim.undotree")

local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", false, true)) do
  local mod = "plugins." .. vim.fn.fnamemodify(file, ":t:r")
  local ok, err = pcall(require, mod)
  if not ok then
    vim.notify("Failed to load " .. mod .. ": " .. err, vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command("PackClean", function()
  for _, p in ipairs(vim.pack.get()) do
    if not p.active then
      vim.pack.del({ p.spec.name }, { force = true })
    end
  end
end, {})
