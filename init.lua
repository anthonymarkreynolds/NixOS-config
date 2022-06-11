vim.cmd ([[
colorscheme one
let g:neovide_refresh_rate=144
let g:neovide_transparency=0.8
let g:neovide_scroll_animation_length=0.175
let g:neovide_floating_opacity=0.65

autocmd FileType nix :packadd vim-nix
autocmd TermOpen * setlocal nonumber norelativenumber

hi WinSeparator guifg=#4b5263

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"AIRLINE
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'

"INDENTLINE
let g:indentLine_char = '▏'
let g:indentLine_color_gui = "#4b5263"
let g:indentline_color_dark = 1
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

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

set.fileencoding = 'utf-8'
set.hidden = true
set.relativenumber = true
set.number = true;

set.list = true
set.listchars = "tab:>-,trail:●"

set.guifont = "monospace:h10"
set.laststatus = 3
set.pastetoggle = '<F3>'


set.termguicolors = true


require("nvim-treesitter.configs").setup {
  ensure_isntalled = "all",
  highlight = {
    enable = true,
    additional_vim_regex_higlighting = false,
  }
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {}
}

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
