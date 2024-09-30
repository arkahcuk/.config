M = {}

local cmp = require "cmp"

M.opts = {
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  mapping = {
    ["<CR>"] = cmp.config.disable
  },
  preselect = cmp.PreselectMode.None,
}

return M
