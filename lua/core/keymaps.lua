local keymap = vim.keymap.set

-- Basic keymaps
keymap("x", "p", "P", { silent = true })
keymap("n", "R", "<C-r>")
keymap("n", "SS", ":w<CR>", { noremap = true, silent = true })
keymap("n", "YY", ":%y<CR>", { noremap = true, silent = true })
keymap("n", "VV", "ggVG", { noremap = true, silent = true })
keymap("n", "DD", "ggVGd", { noremap = true, silent = true })
keymap("n", "QQ", "<cmd>qa<CR>", { noremap = true, silent = true })
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sz", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>sq", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>so", function()
  vim.cmd("wincmd _")
  vim.cmd("wincmd |")
end, { desc = "Make splits equal size" })

keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap("n", "<leader>fn", ":bnext<CR>", { desc = "Next Buffer" })
keymap("n", "<leader>fp", ":bprev<CR>", { desc = "Prev Buffer" })

keymap("t", "<C-w><Left>", function()
	vim.cmd.wincmd("h")
end, { noremap = true, silent = true })
keymap("t", "<C-w><Right>", function()
	vim.cmd.wincmd("l")
end, { noremap = true, silent = true })
keymap("t", "<C-w><Down>", function()
	vim.cmd.wincmd("j")
end, { noremap = true, silent = true })
keymap("t", "<C-w><Up>", function()
	vim.cmd.wincmd("k")
end, { noremap = true, silent = true })

keymap("n", "<leader>ne", "<cmd>BufTermNext<CR>", { desc = "Next Terminal Buffer" })
keymap("n", "<leader>np", "<cmd>BufTermPrev<CR>", { desc = "Prev Terminal Buffer" })
keymap("n", "<leader>nt", "<cmd>call ToggleTerminal()<CR>", { desc = "Open Terminal Buffer" })
keymap("n", "<leader>nx", "<cmd>bdelete!<CR>", { desc = "Close Terminal Buffer" })

keymap("n", "<leader>nv", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.cmd("terminal")
end, { desc = "Split + Terminal" })
keymap("n", "<leader>nz", function()
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.cmd("terminal")
end, { desc = "Split Horizontal + Terminal" })

keymap("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "Format buffer" })

-- Tab management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap("n", "<leader>on", ":ObsidianNew<CR>")
keymap("n", "<leader>g", function()
	local neogit_win = nil
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:match("Neogit") then
			neogit_win = win
			break
		end
	end
	if neogit_win then
		vim.api.nvim_win_close(neogit_win, true)
	else
		vim.cmd("Neogit")
	end
end)

keymap("n", "<leader>dt", function()
	MiniDiff.toggle_overlay()
end, { desc = "Toggle diff overlay" })

keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
keymap("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
keymap("v", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
keymap("n", "<leader>cn", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })
keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
