-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local util = require("util.cowboy")

util.cowboy()

local builtin = require("telescope.builtin")
local keymap = vim.keymap

-- split window
keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })

-- telescope
keymap.set("n", "<leader>fw", function()
  builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end, { desc = "Fuzzy find words" })

-- keep line join
keymap.set("n", "<leader>j", "J")

-- center view on search next/previous word
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- copy to and paste from system clipboard
keymap.set("n", "<leader>cp", '"+p')
keymap.set("n", "<leader>cy", '"+y')

-- TODO
-- paste over other highlighted block without loosing current p buffer
keymap.set("x", "<leader>p", [["_dP]])

-- delete without saving to the buffer
keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- replace what is under the cursor case insensitive in the whole file
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- massive time saver with diagnostics
keymap.set("n", "]q", "<cmd>cnext<CR>zz")
keymap.set("n", "[q", "<cmd>cprev<CR>zz")

-- Increment/decrement number under cursor
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
