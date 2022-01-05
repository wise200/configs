set number " display line numbers
set autoindent " copy indent from line to line
set mouse=a " gui mouse
set so=99 " keep cursor vertically centered
set tabpagemax=32 " allow more tabs open at once


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

call plug#end()

" language servers
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').clangd.setup{}

" color scheme
set termguicolors
colorscheme lucid

"Reload .vimrc
nnoremap <leader>v :source ~/.config/nvim/init.vim<CR>

" tab navigation
nnoremap H gT
nnoremap L gt
nnoremap <C-h> :tabm -1<CR>
nnoremap <C-l> :tabm +1<CR>


" virtual tabstops using spaces
" from: https://vim.fandom.com/wiki/Toggle_between_tabs_and_spaces
let my_tab=4
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
