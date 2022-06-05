local set = vim.opt
 
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

set.fileencoding = 'utf-8'
set.termguicolors = true
set.hidden = true
set.relativenumber = true
set.number = true;

set.list = true
set.listchars = "tab:>-,trail:●"

set.guifont = "monospace:h10"

vim.cmd "colorscheme one"

--require("nvim-treesitter.install").compiles
require("nvim-treesitter.configs").setup {
  ensure_isntalled = "all",
  highlight = {
    enable = true,
    additional_vim_regex_higlighting = false,
  }
}
