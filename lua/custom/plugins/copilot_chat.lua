return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'zbirenbaum/copilot.lua' },
  opts = {
    -- 預設已內建很多命令：:CopilotChat, :CopilotChatExplain, :CopilotChatReview 等
  },
  keys = {
    { '<leader>ce', ':CopilotChatExplain<CR>', mode = { 'n', 'v' }, desc = 'Explain code (Copilot)' },
    { '<leader>cc', ':CopilotChat<CR>', mode = { 'n', 'v' }, desc = 'Chat (Copilot)' },
  },
}
