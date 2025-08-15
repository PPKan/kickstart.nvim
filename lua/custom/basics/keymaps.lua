-- lua/custom/basics/keymaps.lua
local M = {}

-- small helper to apply sane defaults
local function map(mode, lhs, rhs, opts)
  local defaults = { noremap = true, silent = true }
  opts = opts and vim.tbl_extend('force', defaults, opts) or defaults
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.setup()
  -- [[ Basic Keymaps ]]

  -- Custom Keymaps
  map('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw (Ex)' })

  -- Clear highlights on search when pressing <Esc> in normal mode
  map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

  -- Diagnostic keymaps
  map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- Exit terminal mode (may not work in all terminals/tmux)
  map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

  -- Window navigation with CTRL+hjkl
  map('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
  map('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
  map('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
  map('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })

  -- TIP: Disable arrow keys in normal mode (uncomment if desired)
  -- map('n', '<left>',  '<cmd>echo "Use h to move!!"<CR>')
  -- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  -- map('n', '<up>',    '<cmd>echo "Use k to move!!"<CR>')
  -- map('n', '<down>',  '<cmd>echo "Use j to move!!"<CR>')
end

return M
