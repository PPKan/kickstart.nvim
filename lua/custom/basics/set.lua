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

  opt.colorcolumn = '80'
end

return M
