require("indent_blankline").setup({
	char = "▏",
	show_end_of_line = true,
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
vim.cmd([[
hi IndentLineChar guifg=#4b5263
let g:indent_blankline_buftype_exclude = ['nofile','terminal','quickfix','norg']
g:indent_blankline_filetype_exclude = ['lspinfo','packer','checkhealth','help','man','norg','']
]]),

})
