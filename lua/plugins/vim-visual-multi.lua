return {
  'mg979/vim-visual-multi',
  init = function()
    vim.g.VM_default_mappings = 0
  end,
  config = function()
    vim.keymap.set('n', '<C-S-Down>', '<Plug>(VM-Select-Cursor-Down)')
    vim.keymap.set('n', '<C-S-Up>', '<Plug>(VM-Select-Cursor-Up)')
  end,
}
