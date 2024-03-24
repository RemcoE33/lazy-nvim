local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  keys = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<TAB>"] = cmp.mapping.confirm({ select = false }),
  },
}
