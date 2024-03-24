return {
  { "memgraph/cypher.vim" },
  {
    --Overwrite color
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    -- Folding code blocks
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      },
    },
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    },
  },
  {
    "https://github.com/vkolev/gappscript-vim",
  },
}
