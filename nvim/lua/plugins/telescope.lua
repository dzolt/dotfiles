return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',

      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require 'telescope'
      local builtin = require 'telescope.builtin'
      -- local fb_actions = telescope.extensions.file_browser.actions

      telescope.setup {
        pickers = {
          diagnostics = {
            theme = 'ivy',
            initial_mode = 'normal',
            -- Disables preview
            layout_config = {
              preview_cutoff = 9999,
            },
          },
          live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
              return { '--hidden' }
            end,
          },
          find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true,
          },
        },
        defaults = {
          wrap_results = true,
          layout_strategy = 'horizontal',
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      -- Enable Telescope extensions if they are installed
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
      pcall(telescope.load_extension, 'file_browser')

      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = 'Telescope: ' .. desc })
      end

      map('<leader>ff', function()
        builtin.find_files { hidden = true }
      end, '[F]ind [F]iles')

      map('<leader>fF', function()
        builtin.find_files { cwd = false, hidden = true }
      end, '[F]ind [F]iles (Root Dir)')

      map('<leader>fr', function()
        builtin.oldfiles { only_cwd = true }
      end, '[F]ind [R]ecent')

      map('<leader>fR', builtin.oldfiles, '[F]ind [R]ecent (Root Dir)')

      map('<leader>/', function()
        builtin.live_grep { cwd = false, file_ignore_patterns = { '*%-lock.*' } }
      end, 'Live Grep (Root Dir)')

      map('<leader>b/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, '[/] Fuzzily search in current buffer')

      -- Fuzzy find all the symbols in current document.
      -- Symbols are things like variables, functions, types, etc.
      map('<leader>fs', builtin.lsp_document_symbols, '[F]ind Document [S]ymbols')

      -- Fuzzy find all the symbols in current workspace / project.
      -- Symbols are things like variables, functions, types, etc.
      map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    end,
  },
}
