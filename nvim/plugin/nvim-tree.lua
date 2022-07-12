require("nvim-tree").setup({
	update_cwd = true,
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", ':NvimTreeToggle<CR>', opts)
