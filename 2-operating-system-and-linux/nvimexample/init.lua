print("Advent of neovim hello world")

require("config.lazy")

-- Neovim options
-- Indentation
vim.opt.shiftwidth = 4
-- Use system clipbard
vim.opt.clipboard = "unnamedplus"

-- Source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- Run selections
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- ### Begin nvim-mini setup and mini.nvim modules
-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup()

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function()
	vim.o.termguicolors = true
end)
now(function()
	require("mini.statusline").setup()
end)
-- ### End nvim-mini setup and mini.nvim modules
