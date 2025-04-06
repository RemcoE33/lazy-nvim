-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = vim.keymap

km.set("i", "jk", "<Esc>")
km.set("n", "<leader>nh", ":nohl<CR>") -- clear highline
-- Set the keybinding for 'n' and 'N' to move to the search result and center the screen
km.set("n", "n", "nzz")
km.set("n", "N", "Nzz")

-- windows
km.set("n", "<leader>sv", "<C-w>v") --split vertically
km.set("n", "<leader>sh", "<C-w>s") --split horizontally
km.set("n", "<leader>sh", "<C-w>=") --make split windows equal size
km.set("n", "<leader>sx", "<:close<CR>") --close current split window

-- movement
km.set("n", "<C-d>", "<C-d>zz") -- kep cursor centered
km.set("n", "<C-u>", "<C-u>zz") -- kep cursor centered
km.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted lines up
km.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted lines down
km.set("n", "n", "nzzzv") -- center cursor while go to next search
km.set("n", "N", "Nzzzv") -- center cursor while go to prev seach
km.set("n", "J", "mzJ`z") -- places current line to the one above with space
km.set("n", "G", "Gzz") -- center cursor while go to end of file

-- MarkdownTable
km.set("n", "<leader>mt", "<cmd>TableModeToggle<cr>")

-- UFO folding
km.set("n", "zR", require("ufo").openAllFolds)
km.set("n", "zM", require("ufo").closeAllFolds)

-- CodeCompanion
km.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
km.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
km.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
