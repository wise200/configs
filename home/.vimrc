" if necessary, install vim-plug to manage plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" manage plugins
call plug#begin()

Plug 'vim-latex/vim-latex'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'jparise/vim-graphql'

call plug#end()

set termguicolors
colorscheme atom-dark-256

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedMisc=''

" Display relative line numbers
set number
set relativenumber

" Highlight search results
set hlsearch

" Enable search and replace for highlighted text
vnoremap <C-f> y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Customize vim-latex:

"Close error menu
nnoremap <leader>c :cclose<CR> 
"Exit auto-syntax
imap <silent> <c-Space> <c-j>

"Reroute to F5 for bracketing new environments
imap <leader>o <F5>

"use scrolling to center cursor vertically
set so=99

"c++ bracket completion
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O

"uncomment all assertions
nnoremap <leader>a :%s/\/\/assert/assert/g<CR> 
"comment all assertions
nnoremap <leader>z :%s/assert/\/\/assert/g<CR>

"c++ comment selected lines
vnoremap / :s:^\(\s*\)\([^\/\/\t ]\):\1\/\/\2:e<CR>
"c++ uncomment selected lines
vnoremap ? :s:^\(\s*\)\/\/\(\s*\):\1\2:e<CR>

"convert spaces to tabs
nnoremap <leader><Tab> :%s/<Space><Space><Space><Space>/\t/g<CR>

"open next latex question
nnoremap <leader>o /%Insert your solution here!<CR>o 
"skip to next latex question
nnoremap <leader>n /%Insert your solution here!<CR>

"Reload .vimrc
nnoremap <leader>v :source ~/.vimrc<CR>

"$$ Completion
inoremap $<CR> $$<CR>$$<++><Esc>O 

"compile latex
nmap <leader>s :w<CR><leader>ll<CR>

inoremap `m \mbox{}<Esc>i

"matrices and vectors
inoremap `22 \twodv{}{<++>}<++><Esc>hhhhhhhhhhi
inoremap `222 \twodm{}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhi
inoremap `2s \sqrt{2}<++><Esc>hhhhi

inoremap `33 \threedv{}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhi
inoremap `333 \threedm{}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhi


inoremap `<Space>22 \twodvs{}{<++>}<++><Esc>hhhhhhhhhhi
inoremap `<Space>222 \twodms{}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhi

inoremap `<Space>33 \threedvs{}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhi
inoremap `<Space>333 \threedms{}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhi


"not swaggy yet
inoremap `44 \threedv{}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhi
inoremap `444 \threedm{}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}{<++>}<++><Esc>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhi

"Spanish accents
"inoremap <c-a> á
"inoremap <c-e> é
"inoremap <c-i> í
"inoremap <c-o> ó
"inoremap <c-u> ú
"inoremap <c-n> ñ
"inoremap <c-z> Á
"inoremap <c-x> É
"inoremap <c-c> Í
"inoremap <c-v> Ó
"inoremap <c-b> Ú

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
