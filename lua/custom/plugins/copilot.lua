return {
  {
    -- <M-l>：接受 Copilot 的 ghost text
    -- <M-]>：下一個建議
    -- <M-[>：上一個建議
    -- <C-]>：關閉建議
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true, -- 要像 VSCode 自動出現就改成 true
        keymap = {
          accept = '<M-l>', -- 預設
          accept_word = false, -- 想用就改成例如 "<M-w>"
          accept_line = false, -- 想用就改成例如 "<M-L>"
          next = '<M-]>', -- 預設
          prev = '<M-[>', -- 預設
          dismiss = '<C-]>', -- 預設
        },
        panel = { enabled = true },
        copilot_node_command = (vim.fn.exepath 'node' ~= '' and vim.fn.exepath 'node') or nil,
      },
    },
  },

  -- 讓 Copilot 成為 nvim-cmp 的一個 source
  {
    'zbirenbaum/copilot-cmp',
    enabled = false,
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
      -- 把 copilot 插進現有 cmp sources（放在前面提高權重也可）
      local cmp = require 'cmp'
      local cfg = cmp.get_config()
      table.insert(cfg.sources, 1, { name = 'copilot', group_index = 1 })
      cmp.setup(cfg)
    end,
  },
}
