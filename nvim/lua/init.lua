require("lua")
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
-- Lua
-- require("onedark").load() -- Lua
-- require("onedark").setup({
-- 	-- Main options --
-- 	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
-- 	transparent = true, -- Show/hide background
-- 	term_colors = true, -- Change terminal color as per the selected theme style
-- 	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
-- 	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
-- 	-- toggle theme style ---
-- 	toggle_style_key = "<leader>ts", -- Default keybinding to toggle
-- 	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

-- 	-- Change code style ---
-- 	-- Options are italic, bold, underline, none
-- 	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
-- 	code_style = {
-- 		comments = "italic",
-- 		keywords = "none",
-- 		functions = "none",
-- 		strings = "none",
-- 		variables = "none",
-- 		brackets = "none",
-- 	},

-- 	-- Custom Highlights --
-- 	colors = {}, -- Override default colors
-- 	highlights = {}, -- Override highlight groups

-- 	-- Plugins Config --
-- 	diagnostics = {
-- 		darker = true, -- darker colors for diagnostic
-- 		undercurl = true, -- use undercurl instead of underline for diagnostics
-- 		background = true, -- use background color for virtual text
-- 	},
-- })
vim.cmd([[

colorscheme onedark
let g:neovide_refresh_rate=144
let g:neovide_transparency=0.8
let g:neovide_scroll_animation_length=0.175
let g:neovide_floating_opacity=0.65

set timeout timeoutlen=3000 ttimeoutlen=100

let mapleader = "\<Space>"

autocmd FileType nix :packadd vim-nix
autocmd TermOpen * setlocal nonumber norelativenumber

hi WinSeparator guifg=#2c323c
hi NvimTreeWinSeparator guifg=#2c323c

hi TelescopeBorder guifg=#828997
hi TelescopePreviewBorder guifg=#2c323c
hi TelescopePromptBorder guifg=#2c323c
hi TelescopeResultsBorder guifg=#2c323c

hi ToggleTerm1FloatBorder guifg=#2c323c

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <c-\><c-n><C-w>h
tnoremap <C-j> <c-\><c-n><C-w>j
tnoremap <C-k> <c-\><c-n><C-w>k
tnoremap <C-l> <c-\><c-n><C-w>l

tnoremap <c-ESC> <c-\><c-n>

nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
]])

local set = vim.opt
local let = vim.o
local letg = vim.go

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.scrolloff = 5

set.fileencoding = "utf-8"
set.hidden = true
set.number = true
set.relativenumber = true

set.list = true
set.listchars = "tab:>->,trail:●,eol:↴,space:⋅"

set.guifont = "monospace:h10"
set.laststatus = 3
set.pastetoggle = "<F3>"
set.mouse = "a"

set.termguicolors = true

require("indent_blankline").setup({
	char = "▏",
	show_end_of_line = true,
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
	vim.cmd([[
    hi IndentLineChar guifg=#4b5263
  ]]),
})

require("nvim-treesitter.configs").setup({
	ensure_isntalled = "all",
	highlight = {
		enable = true,
		additional_vim_regex_higlighting = false,
	},
})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {},
	extensions = {},
})

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})
-- LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
	})
end

local sumneko_binary_path = vim.fn.exepath("lua-language-server")
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

require("nvim-tree").setup({
	update_cwd = true,
})

require("nvim-treesitter.configs").setup({
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
})
-- require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
--   auto_reload_on_write = true,
--   create_in_closed_folder = false,
--   disable_netrw = false,
--   hijack_cursor = false,
--   hijack_netrw = true,
--   hijack_unnamed_buffer_when_opening = false,
--   ignore_buffer_on_setup = false,
--   open_on_setup = false,
--   open_on_setup_file = false,
--   open_on_tab = false,
--   sort_by = "name",
--   update_cwd = false,
--   reload_on_bufenter = false,
--   respect_buf_cwd = false,
--   view = {
--     adaptive_size = false,
--     centralize_selection = false,
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = "left",
--     preserve_window_proportions = false,
--     number = false,
--     relativenumber = false,
--     signcolumn = "yes",
--     mappings = {
--       custom_only = false,
--       list = {
--         -- user mappings go here
--       },
--     },
--   },
--   renderer = {
--     add_trailing = false,
--     group_empty = false,
--     highlight_git = false,
--     full_name = false,
--     highlight_opened_files = "none",
--     root_folder_modifier = ":~",
--     indent_markers = {
--       enable = false,
--       icons = {
--         corner = "└ ",
--         edge = "│ ",
--         item = "│ ",
--         none = "  ",
--       },
--     },
--     icons = {
--       webdev_colors = true,
--       git_placement = "before",
--       padding = " ",
--       symlink_arrow = " ➛ ",
--       show = {
--         file = true,
--         folder = true,
--         folder_arrow = true,
--         git = true,
--       },
--       glyphs = {
--         default = "",
--         symlink = "",
--         folder = {
--           arrow_closed = "",
--           arrow_open = "",
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = "",
--           symlink_open = "",
--         },
--         git = {
--           unstaged = "✗",
--           staged = "✓",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "★",
--           deleted = "",
--           ignored = "◌",
--         },
--       },
--     },
--     special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
--   },
--   hijack_directories = {
--     enable = true,
--     auto_open = true,
--   },
--   update_focused_file = {
--     enable = false,
--     update_cwd = false,
--     ignore_list = {},
--   },
--   ignore_ft_on_setup = {},
--   system_open = {
--     cmd = "",
--     args = {},
--   },
--   diagnostics = {
--     enable = false,
--     show_on_dirs = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     },
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},
--     exclude = {},
--   },
--   filesystem_watchers = {
--     enable = false,
--     interval = 100,
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 400,
--   },
--   actions = {
--     use_system_clipboard = true,
--     change_dir = {
--       enable = true,
--       global = false,
--       restrict_above_cwd = false,
--     },
--     expand_all = {
--       max_folder_discovery = 300,
--     },
--     open_file = {
--       quit_on_open = false,
--       resize_window = true,
--       window_picker = {
--         enable = true,
--         chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--         exclude = {
--           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
--           buftype = { "nofile", "terminal", "help" },
--         },
--       },
--     },
--     remove_file = {
--       close_window = true,
--     },
--   },
--   trash = {
--     cmd = "gio trash",
--     require_confirm = true,
--   },
--   live_filter = {
--     prefix = "[FILTER]: ",
--     always_show_folders = true,
--   },
--   log = {
--     enable = false,
--     truncate = false,
--     types = {
--       all = false,
--       config = false,
--       copy_paste = false,
--       diagnostics = false,
--       git = false,
--       profile = false,
--       watcher = false,
--     },
--   },
-- } -- END_DEFAULT_OPTS

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

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
})
-- require('bufferline').setup {
--   options = {
--     mode = "buffers", -- set to "tabs" to only show tabpages instead
--     numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
--     close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
--     right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
--     left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
--     middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
--     -- NOTE: this plugin is designed with this icon in mind,
--     -- and so changing this is NOT recommended, this is intended
--     -- as an escape hatch for people who cannot bear it for whatever reason
--     indicator_icon = '▎',
--     buffer_close_icon = '',
--     modified_icon = '●',
--     close_icon = '',
--     left_trunc_marker = '',
--     right_trunc_marker = '',
--     --- name_formatter can be used to change the buffer's label in the bufferline.
--     --- Please note some names can/will break the
--     --- bufferline so use this at your discretion knowing that it has
--     --- some limitations that will *NOT* be fixed.
--     name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
--       -- remove extension from markdown files for example
--       if buf.name:match('%.md') then
--         return vim.fn.fnamemodify(buf.name, ':t:r')
--       end
--     end,
--     max_name_length = 18,
--     max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
--     tab_size = 18,
--     diagnostics = false | "nvim_lsp" | "coc",
--     diagnostics_update_in_insert = false,
--     diagnostics_indicator = function(count, level, diagnostics_dict, context)
--       return "("..count..")"
--     end,
--     -- NOTE: this will be called a lot so don't do any heavy processing here
--     custom_filter = function(buf_number, buf_numbers)
--       -- filter out filetypes you don't want to see
--       if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
--         return true
--       end
--       -- filter out by buffer name
--       if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
--         return true
--       end
--       -- filter out based on arbitrary rules
--       -- e.g. filter out vim wiki buffer from tabline in your work repo
--       if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
--         return true
--       end
--       -- filter out by it's index number in list (don't show first buffer)
--       if buf_numbers[1] ~= buf_number then
--         return true
--       end
--     end,
--     offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
--     color_icons = true | false, -- whether or not to add the filetype icon highlights
--     show_buffer_icons = true | false, -- disable filetype icons for buffers
--     show_buffer_close_icons = true | false,
--     show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
--     show_close_icon = true | false,
--     show_tab_indicators = true | false,
--     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--     -- can also be a table containing 2 custom separators
--     -- [focused and unfocused]. eg: { '|', '|' }
--     separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
--     enforce_regular_tabs = false | true,
--     always_show_bufferline = true | false,
--     sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
--       -- add custom logic
--       return buffer_a.modified > buffer_b.modified
--     end
--   }
-- }
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

require("neorg").setup({
	load = {
		["core.defaults"] = {},
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

-- vim.cmd([[
--   hi Normal guibg=#181a1f
-- ]])
