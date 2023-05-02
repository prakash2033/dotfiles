-- References
-- YouTube ThePrimeagen: 0 to LSP : Neovim RC From Scratch https://www.youtube.com/watch?v=w7i4amO_zaE&t=966s
-- YouTube Josean Martinez: How I Setup Neovim On My Mac To Make It Amazing - Complete Guide https://www.youtube.com/watch?v=vdn_pKJUda8

-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Move thru word wrapped line
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

--Remove newbie crutches in Insert, Normal and Visual Mode
keymap.set({ "i", "n", "v" }, "<Down>", "<Nop>")
keymap.set({ "i", "n", "v" }, "<Left>", "<Nop>")
keymap.set({ "i", "n", "v" }, "<Right>", "<Nop>")
keymap.set({ "i", "n", "v" }, "<Up>", "<Nop>")
keymap.set("n", "Q", "<Nop>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- movement keymaps
keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move selected line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") --move selected line up
keymap.set("n", "J", "mzJ`z") --keeps cursor at the beginning instead of eol
keymap.set("n", "<C-d>", "<C-d>zz") --scroll down half page and keeps cursor in middle
keymap.set("n", "<C-u>", "<C-u>zz") --scroll down half page and keeps cursor in middle
keymap.set("n", "n", "nzzzv") --keeps cursor in middle while searching forward
keymap.set("n", "N", "Nzzzv") --keeps cursor in middle while searching backward

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]]) --deletes highlighted word in void register and then paste it over

-- next greatest remap ever
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) --yanks into system clipboard in normal and visual mode
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) --deletes to void register

-- This is going to get me cancelled
keymap.set("i", "<C-c>", "<Esc>") --also helps to exit in vertical insert mode Ctrl+v, Shift+I, "text", Ctrl+C

-- find and replace
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- Formatting
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- undo tree
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>") --undo tree

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<C-g>", "<cmd>Telescope git_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>") -- find old files

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>ggs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>gs", "<cmd>Git<CR>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
