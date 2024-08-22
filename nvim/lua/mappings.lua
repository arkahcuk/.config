require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<A-k>", function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

map('v', '<C-c>', '"+y', { noremap = true, silent = true })

local function toggle_line_numbers()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        vim.wo.number = true
    else
        vim.wo.relativenumber = true
        vim.wo.number = true
    end
end

map('n', '<A-r>', toggle_line_numbers, { noremap = true, silent = true, desc = "Toggle relative/absolute line numbers" })
map('n', "<C-z>", ":%y+<CR>", { desc = "Copy all lines" })
