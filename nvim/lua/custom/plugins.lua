local cmpconfig = require "cmp"

---@type NvPluginSpec[]
local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = cmpconfig.opts,
    lazy = false,
  },
}

return plugins

