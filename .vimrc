luafile ~/flakes/nixos/init.lua

autocmd FileType nix :packadd vim-nix
autocmd TermOpen * setlocal nonumber norelativenumber

" system clipboard
" nmap <c-c> "+y
" vmap <c-c> "+y
" nmap <c-v> "+p
inoremap <c-v> <c-r>+
" cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
" inoremap <c-r> <c-v>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

"INDENTLINE
let g:indentLine_char = '▏'
let g:indentLine_color_gui = "#4b5263"
let g:indentline_color_dark = 1
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

"NERDTREE
nmap <F6> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeStatusline = '%#NonText#'

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end
