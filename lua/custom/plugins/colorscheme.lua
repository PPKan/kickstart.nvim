return {
  -- 顏色主題
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      -- 一鍵關掉主題預設的斜體
      styles = { italic = false },
      -- 想更保險就把常見群組也明確設成非斜體
      highlight_groups = {
        Comment = { italic = false },
        ['@comment'] = { italic = false },
        ['@keyword'] = { italic = false },
        ['@keyword.function'] = { italic = false },
        ['@function'] = { italic = false },
        ['@lsp.type.function'] = { italic = false },
        ['@lsp.type.parameter'] = { italic = false },
        ['@lsp.type.keyword'] = { italic = false },
      },
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'rose-pine'
    end,
  },

  -- 你也裝了 tokyonight，順手給一個「不斜體」版本（可留可刪）
  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'night',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  -- lualine 獨立存在即可，不要在這裡放 highlight_groups
  { 'nvim-lualine/lualine.nvim' },
}
