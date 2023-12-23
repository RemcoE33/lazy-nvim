-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = vim.keymap

km.set("i", "jk", "<Esc>")
km.set("n", "<leader>nh", ":nohl<CR>") -- clear highline
km.set("n", "p", [[:let temp=@0<CR>:normal! "0p<CR>:let @0=temp<CR>]], { noremap = true, silent = true }) -- don't copy to clipboard
km.set("n", "P", [[:let temp=@0<CR>:normal! "0P<CR>:let @0=temp<CR>]], { noremap = true, silent = true })

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

-- trouble
km.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
km.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
km.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
km.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
km.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
km.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- harpoon
km.set("n", "<leader>h", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>') -- open the file naviagtion ui
km.set("n", "<leader>a", '<cmd>lua require("harpoon.mark").add_file()<cr>') -- add file
km.set("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>') -- go to file 1
km.set("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
km.set("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
km.set("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
km.set("n", "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>')

-- MarkdownTable
km.set("n", "<leader>mt", "<cmd>TableModeToggle<cr>")
