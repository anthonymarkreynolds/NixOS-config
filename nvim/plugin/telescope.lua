require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<leader>ff"] = "find_files",
				["<leader>fg"] = "find_grep",
				["<leader>fb"] = "buffers",
				["<leader>fh"] = "help_tags",
			},
		},
	},
	pickers = {},
	extensions = {},
})

