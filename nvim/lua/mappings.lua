require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set


local function toggle_line_numbers()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        vim.wo.number = true
    else
        vim.wo.relativenumber = true
        vim.wo.number = true
    end
end

-- ; or : to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Alt+k to accept copilot suggestion
map("i", "<A-k>", function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- Ctrl+c to copy to system clipboard
map('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Alt+r to toggle relative/absolute line numbers
map('n', '<A-r>', toggle_line_numbers, { noremap = true, silent = true, desc = "Toggle relative/absolute line numbers" })

-- Ctrl+z to select all lines 
map('n', "<C-z>", "ggVG", { desc = "Selct all lines" })
-- map('n', "<C-z>", ":%y+<CR>", { desc = "Copy all lines" })
