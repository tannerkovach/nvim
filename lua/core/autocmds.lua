local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank({
      higroup = "HighlightYank",
      timeout = 150,
    })
  end,
})

-- Set up RainbowTrails
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = augroup("RainbowTrails"),
  callback = function()
    local highlights = {
      { "RainbowRed",    "#004d40" },
      { "RainbowOrange", "#006d5b" },
      { "RainbowYellow", "#008d76" },
      { "RainbowGreen",  "#00ad91" },
      { "RainbowBlue",   "#00cdac" },
      { "RainbowIndigo", "#00edc7" },
      { "RainbowViolet", "#7fffd4" }
    }

    for _, hl in ipairs(highlights) do
      vim.api.nvim_set_hl(0, hl[1], {
        bg = hl[2],
        fg = "NONE",
        nocombine = true,
        default = false
      })
    end
  end
})

-- Auto-activate RainbowTrails
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("AutoRainbowTrails"),
  callback = function()
    vim.cmd("RainbowTrails")
  end
})

-- Set up yank highlight colors
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "HighlightYank", {
      bg = "NvimLightGreen",
      fg = "#000000"
    })
  end,
})

-- Obsidian auto-creation
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    if vim.b.obsidian_new_ran then
      return
    end

    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buftype ~= '' then
      return
    end

    local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
    if filetype ~= '' then
      return
    end

    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname == '' then
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p')
      local notes_dir = vim.fn.fnamemodify(vim.fn.expand('~/Documents/Notes'), ':p')

      if string.sub(cwd, 1, string.len(notes_dir)) == notes_dir then
        vim.b.obsidian_new_ran = true
        vim.cmd('ObsidianNew')
        vim.opt.filetype = 'markdown'
      end
    end
  end
})
