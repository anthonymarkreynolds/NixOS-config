vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	update_cwd = true,
	auto_reload_on_write = true,
	open_on_setup = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			error = " ", warning = " ", hint = " ", info = " "
		}
	},
    renderer = {
		highlight_git = true,
      icons = {
        webdev_colors = true,
        git_placement = "before",
        show = {
          git = true,
        },
		glyphs = {
            git = {
              unstaged = "✕",
              staged = "✔",
              unmerged = "",
              renamed = "➜",
              untracked = "*",
              deleted = "",
              ignored = "◌",
            },
		}
      },
    },
	view = {
		hide_root_folder = true,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", ':NvimTreeToggle<CR>', opts)
