"-------- Settings {{{
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set nohlsearch
set ruler
set cursorline
set laststatus=2 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard^=unnamed,unnamedplus
set encoding=utf-8
set fileencoding=utf-8 
set shortmess+=I
set backspace=indent,eol,start
set hidden
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
"}}}

"-------- Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/suan/vim-instant-markdown', {'for': 'markdown'} " Install nodejs mini server by running  npm -g install instant-markdown-d
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'https://github.com/sirver/UltiSnips'               " snippet program only, no code snippet provided
Plug 'https://github.com/honza/vim-snippets'             " code snippet of many programming language
Plug 'https://github.com/tpope/vim-surround'             " Help surround with :h
Plug 'https://github.com/scrooloose/nerdtree'            " File explorer

"Git
Plug 'https://github.com/airblade/vim-gitgutter'         " Git gutter
Plug 'https://github.com/tpope/vim-fugitive'             " Git interface
Plug 'https://github.com/tpope/vim-rhubarb'              " Enable GBrowse from fugitive for GitHub
Plug 'https://github.com/junegunn/gv.vim'                " TIG like navigation for vim
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
Plug 'https://github.com/tveskag/nvim-blame-line'        " Add git blame on line
call plug#end()
"}}}

"-------- Folding {{{
"------------------------------------------------------
" za - open and close fold, zR - open all, zM - close all, zF - create fold
" enable folding; http://vim.wikia.com/wiki/Folding
set foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

"}}}

"-------- Keybindings {{{
" Default vim leader \
" toggle relative numbering
nnoremap <C-n> :set rnu! <bar> set nu!<CR>

" Move thru word wrapped line 
nnoremap k gk
nnoremap j gj

" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" NerdTree keybinding
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
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

colorscheme gruvbox

"}}}

"-------- NerdTree {{{
" Exit Vim if NERDTree is the only window remaining in the only tab.
" Shift + I to show dotfiles
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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
