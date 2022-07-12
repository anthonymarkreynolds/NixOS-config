require("toggleterm").setup({
	open_mapping = [[<c-a>]],
	-- shade_terminals = true,
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		Normal = {
			guibg = "NONE",
		},
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("t", "<C-h>", "<c-\\><c-n><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<c-\\><c-n><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<c-\\><c-n><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<c-\\><c-n><C-w>l", opts)
vim.keymap.set("t", "<c-ESC>","<c-\\><c-n>", opts)

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	close_on_exit = true,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
