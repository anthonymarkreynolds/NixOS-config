require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
	highlights = {
		fill = {
			guibg = "#282c34",
		},
		buffer = {
			guibg = "#282c34",
		},
		buffer_selected = {
			guibg = "#282c34",
		},
	},
})
