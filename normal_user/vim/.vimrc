syntax on 			     " enable color syntax
syntax enable                        " Enable syntax highlights
set ttyfast                          " Faster refraw
" set mouse=nv                         " Mouse activated in Normal and Visual Mode
set shortmess+=I                     " No intro when starting Vim
set autoindent                       " Copy the indent of the current line into a new line
set smartindent                      " Smart... indent
set expandtab                        " Insert spaces instead of tabs
set softtabstop=2                    " ... and insert two spaces
set shiftwidth=2                     " Indent with two spaces
set incsearch			     " Increamental search, find as you type word
set nohlsearch                       " Highlight search results
set cursorline                       " Highligt the cursor line
" set cursorcolumn                     " Highlight the column line
set showmatch                        " When a bracket is inserted, briefly jump to the matching one
set matchtime=3                      " ... during this time
set virtualedit=onemore              " Allow the cursor to move just past the end of the line
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set history=100                      " Keep 100 undo
set wildmenu                         " Better command-line completion
set scrolloff=10                     " Always keep 10 lines after or before when scrolling
set sidescrolloff=5                  " Always keep 5 lines after or before when side scrolling
" set noshowmode                       " Don't display the current mode
set gdefault                         " The substitute flag g is on
set hidden                           " Hide the buffer instead of closing when switching
set backspace=indent,eol,start       " The normal behaviour of backspace
" set showtabline=2                    " Always show tabs
set laststatus=2                     " Always show status bar
set number                           " Show the line number
set relativenumber
set updatetime=1000
set ignorecase                       " Search insensitive
set smartcase                        " ... but smart
set showbreak=↪
set encoding=utf-8                   " The encoding displayed.
set fileencoding=utf-8               " The encoding written to file.
set synmaxcol=300                    " Don't try to highlight long lines
" set guioptions-=T                    " Don't show toolbar in Gvim

" move thru word wrapped line
nnoremap k gk
nnoremap j gj

" Open all cmd args in new tabs
execute ":silent :tab all"

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

syntax enable
set background=dark

colorscheme gruvbox
