require("nvim-treesitter.configs").setup({
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	ensure_isntalled = "all",
	highlight = {
		enable = true,
		additional_vim_regex_higlighting = false,
	},
})
