-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set linewrap true when editing .md files.
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.txt" },
  group = group,
  command = "setlocal wrap",
})

vim.g.vimwiki_list = {
  {
    path = "/Users/remcoedelenbos/notes/",
    syntax = "markdown",
    ext = ".md",
    nested_syntaxes = {
      python = "python",
      js = "javascript",
      go = "go",
      json = "json",
      svelte = "svelte",
      bash = "bash",
    },
  },
}

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.cursorline = true
vim.cmd([[
  highlight CursorLine guibg=#292D37
]])

vim.g.vimwiki_markdown_link_ext = 1

-- UFO folding settings
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
