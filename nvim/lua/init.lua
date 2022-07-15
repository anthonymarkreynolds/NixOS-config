require("other_modules/keybinds")
vim.cmd([[
let mapleader = "\<Space>"
set timeout timeoutlen=3000 ttimeoutlen=100
autocmd TermOpen * setlocal nonumber norelativenumber
]])

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
