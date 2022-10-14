require("onedark").load() -- Lua
require("onedark").setup({
	-- Main options --
	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
	-- toggle theme style ---
	toggle_style_key = "<leader>ts", -- Default keybinding to toggle
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
		brackets = "none",
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
vim.cmd([[
let g:neovide_refresh_rate=144
let g:neovide_transparency=0.8
let g:neovide_scroll_animation_length=0.175
let g:neovide_floating_opacity=0.65

hi WinSeparator guifg=#2c323c
hi NvimTreeWinSeparator guifg=#2c323c

hi TelescopeBorder guifg=#828997
hi TelescopePreviewBorder guifg=#2c323c
hi TelescopePromptBorder guifg=#2c323c
hi TelescopeResultsBorder guifg=#2c323c

hi ToggleTerm1FloatBorder guifg=#2c323c

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
hi NvimTreeNormal guibg=#282c34
hi NvimTreeEndOfBuffer guibg=#282c34
hi lualine_c_normal guibg=#282c34
hi lualine_transitional_lualine_b_normal_to_lualine_c_normal guibg=#282c34
hi lualine_transitional_lualine_b_diff_added_normal_to_lualine_c_normal guibg=#282c34
hi lualine_transitional_lualine_b_diff_added_normal_to_lualine_c_insert guibg=#282c34
hi lualine_transitional_lualine_b_diff_added_normal_to_lualine_c_command guibg=#282c34
hi lualine_x_filetype_DevIconLua_normal guibg=#282c34
hi lualine_x_filetype_DevIconLua_insert guibg=#282c34
hi lualine_x_filetype_DevIconLua_command guibg=#282c34
hi lualine_x_filetype_DevIconLua_inactive guibg=#282c34
hi lualine_x_filetype_DevIconLua_terminal guibg=#282c34

]])
