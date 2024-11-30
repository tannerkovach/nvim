local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "HighlightYank",
			timeout = 150,
		})
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "HighlightYank", {
			bg = "NvimLightGreen",
			fg = "#000000",
		})
		vim.api.nvim_set_hl(0, "StatusLine", { fg = "NvimLightGray1", bg = "NvimDarkCyan" })
		vim.api.nvim_set_hl(0, "Cursor", { fg = "NvimLightGray1", bg = "NvimDarkCyan" })
		vim.api.nvim_set_hl(0, "CurSearch", { fg = "NvimLightGray1", bg = "NvimDarkCyan" })
		vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#000000", bg = "NvimLightRed" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#dddfe7" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLineSel", { fg = "NvimLightGrey1", bg = "NvimDarkCyan" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#dddfe7" })
		vim.api.nvim_set_hl(0, "Visual", {
			bg = "NvimLightGreen",
			fg = "#000000",
    })
	end,
})

-- Obsidian auto-creation
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	callback = function()
-- 		local buf = vim.api.nvim_get_current_buf()
--
-- 		if vim.b.obsidian_new_ran then
-- 			return
-- 		end
--
-- 		local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
-- 		if buftype ~= "" then
-- 			return
-- 		end
--
-- 		local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
-- 		if filetype ~= "" then
-- 			return
-- 		end
--
-- 		local bufname = vim.api.nvim_buf_get_name(buf)
-- 		if bufname == "" then
-- 			local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
-- 			local notes_dir = vim.fn.fnamemodify(vim.fn.expand("~/Documents/Notes"), ":p")
--
-- 			if string.sub(cwd, 1, string.len(notes_dir)) == notes_dir then
-- 				vim.b.obsidian_new_ran = true
-- 				vim.cmd("ObsidianNew")
-- 				vim.opt.filetype = "markdown"
-- 			end
-- 		end
-- 	end,
-- })

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

