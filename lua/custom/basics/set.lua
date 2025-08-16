-- lua/custom/basics/set.lua
local M = {}

function M.setup()
  local opt = vim.opt

  -- [[ Basic Settings ]]
  -- opt.guicursor = ""

  opt.number = true
  opt.relativenumber = true

  opt.tabstop = 4
  opt.softtabstop = 4
  opt.shiftwidth = 4
  opt.expandtab = true
  opt.smartindent = true

  opt.wrap = false

  opt.swapfile = false
  opt.backup = false

  local home = (vim.fn.has 'win32' == 1 and os.getenv 'USERPROFILE') or os.getenv 'HOME'
  local undodir = home .. '/.vim/undodir'
  vim.fn.mkdir(undodir, 'p')
  opt.undodir = undodir
  opt.undofile = true

  opt.hlsearch = false
  opt.incsearch = true

  opt.termguicolors = true

  opt.scrolloff = 8
  opt.signcolumn = 'yes'
  opt.isfname:append '@-@'

  opt.updatetime = 50


  -- This is to indicate the line is too long
  -- opt.colorcolumn = '80'

  -- use J and K in visual mode to move lines (with auto indent!)
  vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true, silent = true })

  -- center the cursor
  vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

  -- add a new paste/delete buffer
  vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<leader>d', '"_d', { noremap = true, silent = true })

  -- yank to system clipboard
  vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>Y', '"+Y', { noremap = true, silent = true })

  -- disable Q
  vim.api.nvim_set_keymap('n', 'Q', '<nop>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap('n', '$', 'g$', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '0', 'g0', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'gg', 'gg0', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'G', 'G$', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

  -- config virtual line for diagnostics
  vim.diagnostic.config { virtual_text = true }
end

return M
