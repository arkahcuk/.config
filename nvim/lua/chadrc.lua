-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "red",
}

M.ui = {
   theme = "red",
   hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
   },
}

M.plugins = "custom.plugins"

vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.clipboard = ""  -- Default to unnamed register

return M
