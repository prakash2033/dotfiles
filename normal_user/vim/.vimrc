"-------- Settings {{{
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set incsearch
set nohlsearch
set ruler
set cursorline
set laststatus=2 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
set encoding=utf-8
set fileencoding=utf-8 
"}}}

"-------- Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/suan/vim-instant-markdown.git'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'https://github.com/sirver/UltiSnips'    " snippet program only, no code snippet provided
Plug 'https://github.com/honza/vim-snippets'  " code snippet of many programming language
Plug 'https://github.com/tpope/vim-surround'  " :help surround
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'

call plug#end()
"}}}

"-------- Folding {{{
"------------------------------------------------------
" enable folding; http://vim.wikia.com/wiki/Folding
set foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

" folding hotkeys
" S-v zf while in visual line mode create fold
" C-v zf while is visual block mode create fold
" zf#j   creates a fold from the cursor down numbers of lines.
" zf/    string creates a fold from the cursor to string .
" za     When on a closed fold, open it.and vice-versa.
" zA     When on a closed fold, open it recursively.and vice-versa
" zj     moves the cursor to the next fold.
" zk     moves the cursor to the previous fold.
" zo     opens a fold at the cursor.
" zO     opens all folds at the cursor.
" zm     increases the foldlevel by one.
" zM     closes all open folds.
" zr     decreases the foldlevel by one.
" zR     decreases the foldlevel to zero -- all folds will be open.
" zd     deletes the fold at the cursor.
" zE     deletes all folds.
" [z     move to start of open fold.
" ]z     move to end of open fold.

"}}}

"-------- Keybindings {{{
nnoremap <silent> <leader>l :set relativenumber! <bar> set nu!<CR>

" Move thru word wrapped line 
nnoremap k gk
nnoremap j gj
"}}}

"-------- vimwiki - Personal Wiki for Vim (Markdown Supported) {{{
"------------------------------------------------------
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on

" enable markdown in vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" helppage -> :h vimwiki-syntax
"}}}

"-------- vim-instant-markdown - Instant Markdown previews from Vim {{{
"------------------------------------------------------
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart

" start instant markdown preview manually
map <leader>md :InstantMarkdownPreview<CR>

"}}}

"-------- Colorscheme and theme {{{
syntax enable
set background=dark

colorscheme gruvbox"
"}}}

"-------- Auto source vimrc {{{
"------------------------------------------------------
" watch for changes then auto source vimrc
" http://stackoverflow.com/a/2403926
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"}}}
