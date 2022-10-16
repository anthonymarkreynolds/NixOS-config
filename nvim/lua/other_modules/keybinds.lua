function closeBuf()
	local currentBuffer = vim.api.nvim_get_current_buf()
	vim.cmd("bp")
	vim.api.nvim_buf_delete(currentBuffer, {})
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
