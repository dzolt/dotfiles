return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<leader>bd', require('config/utils').bufremove, desc = 'Delete Buffer' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
    { '<leader>bb', '<cmd>e #<cr>', desc = 'Switch to Other Buffer' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  config = function()
    local local_utils = require 'config/utils'
    local icons = local_utils.icons

    require('bufferline').setup {
      options = {
        --stylua: ignore
        close_command = function(n) local_utils.bufremove(n) end,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local diagIcons = icons.diagnostics
          local ret = (diag.error and diagIcons.Error .. diag.error .. ' ' or '') .. (diag.warning and diagIcons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        ---@param opts bufferline.IconFetcherOpts
        get_element_icon = function(opts)
          return icons.ft[opts.filetype]
        end,
      },
    }
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
