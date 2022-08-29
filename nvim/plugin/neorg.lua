require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.gtd.base"] = {
			config = {}
		},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
	},
})
