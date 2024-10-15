-- local util = require("util.cowboy")

-- util.cowboy()

-- local builtin = require("telescope.builtin")
local keymap = vim.keymap

-- lazy -- NOT WORKING WHY??
keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- disable recent commands window
keymap.set({ 'n', 'v', 's' }, 'q:', '<Nop>')

-- split window
keymap.set('n', '<leader>w\\', '<C-W>v') --{ desc = 'Split window right', remap = true })

-- telescope
-- keymap.set("n", "<leader>fw", function()
--   builtin.grep_string({ search = vim.fn.input("Grep For > ") })
-- end, { desc = "Fuzzy find words" })

-- keep line join
keymap.set('n', '<leader>j', 'J')

-- center view on search next/previous word
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

-- copy to and paste from system clipboard
keymap.set('n', '<leader>cp', '"+p')
keymap.set('n', '<leader>cy', '"+y')

-- TODO
-- paste over other highlighted block without loosing current p buffer
keymap.set('x', '<leader>p', [["_dP]])

-- delete without saving to the buffer
keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- replace what is under the cursor case insensitive in the whole file
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- massive time saver with diagnostics
keymap.set('n', ']q', '<cmd>cnext<CR>zz')
keymap.set('n', '[q', '<cmd>cprev<CR>zz')

-- Increment/decrement number under cursor
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- save file
keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- quit -- NOT WORKING WHYYY?
keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- Move to window using the <ctrl> hjkl keys
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Move Lines
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- buffers not working -- why??
-- local bufremove = function(buf)
--   buf = buf or 0
--   buf = buf == 0 and vim.api.nvim_get_current_buf() or buf
--
--   if vim.bo.modified then
--     local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
--     if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
--       return
--     end
--     if choice == 1 then -- Yes
--       vim.cmd.write()
--     end
--   end
--
--   for _, win in ipairs(vim.fn.win_findbuf(buf)) do
--     vim.api.nvim_win_call(win, function()
--       if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
--         return
--       end
--       -- Try using alternate buffer
--       local alt = vim.fn.bufnr '#'
--       if alt ~= buf and vim.fn.buflisted(alt) == 1 then
--         vim.api.nvim_win_set_buf(win, alt)
--         return
--       end
--
--       -- Try using previous buffer
--       local has_previous = pcall(vim.cmd, 'bprevious')
--       if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
--         return
--       end
--
--       -- Create new listed buffer
--       local new_buf = vim.api.nvim_create_buf(true, false)
--       vim.api.nvim_win_set_buf(win, new_buf)
--     end)
--   end
--   if vim.api.nvim_buf_is_valid(buf) then
--     pcall(vim.cmd, 'bdelete! ' .. buf)
--   end
-- end
--
-- keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
-- keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
-- keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
-- keymap.set('n', '<leader>bd', bufremove, { desc = 'Delete Buffer' })

-- Clear search with <esc>
keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- saner n and N behaviour
keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- lazygit
-- change somehow and add lazygit
-- function M.git()
--   local root = M.get()
--   local git_root = vim.fs.find(".git", { path = root, upward = true })[1]
--   local ret = git_root and vim.fn.fnamemodify(git_root, ":h") or root
--   return ret
-- end
-- map('n', '<leader>gg', function()
--   LazyVim.lazygit { cwd = LazyVim.root.git() }
-- end, { desc = 'Lazygit (Root Dir)' })
