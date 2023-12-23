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

vim.g.vimwiki_markdown_link_ext = 1
