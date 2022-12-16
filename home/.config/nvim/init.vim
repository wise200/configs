set number " display line numbers
set autoindent " copy indent from line to line
set mouse=a " gui mouse
set scrolloff=99 " keep cursor vertically centered
set tabpagemax=32 " allow more tabs open at once
set nowrap


" install vim-plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" manage plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " auto update parsers
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" VimTeX
filetype plugin indent on
syntax on
let maplocalleader = "`"

" Vim snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnips"]

" language servers
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').clangd.setup{}

" LSP configuration
" (this could definitely be refined, see nvim-lspconfig README)
nnoremap gd :lua vim.lsp.buf.definition()<CR>

" color scheme
set termguicolors
colorscheme onedark

"Reload .vimrc
nnoremap <leader>v :source ~/.config/nvim/init.vim<CR>

" tab navigation
nnoremap H gT
nnoremap L gt
nnoremap <C-h> :tabm -1<CR>
nnoremap <C-l> :tabm +1<CR>


" virtual tabstops using spaces
" from: https://vim.fandom.com/wiki/Toggle_between_tabs_and_spaces
let my_tab=2
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z
nmap <F10> :let my_tab=


" fuzzy search
nnoremap <leader>f :Files<CR>
let $FZF_DEFAULT_COMMAND = 'find . -type f'

" copy to clipboard
vnoremap <leader>c "+y

" treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
  },
}
EOF

" file explorer
nnoremap <leader>d :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" auto close brackets
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" color column
set cc=80

" smart case for text search
set ignorecase
set smartcase
