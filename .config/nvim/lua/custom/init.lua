---------- CORE OPTIONS ----------

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- For conciseness

--opt.relativenumber = true
--opt.number = true

-- Tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent with
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Use indent from current line when starting a new one
opt.smartindent = true -- Use smart indent

opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Assume case-sensitive search when mixing cases in search

opt.cursorline = true -- Visible cursorline

-- Coloring & theme
opt.termguicolors = true -- Enabling true colors
opt.background = "dark" -- Setting colorschemes to dark when possible
opt.signcolumn = "yes" -- Show sign column to prevent text shifting

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom


---------- KEYMAPS ----------

vim.g.mapleader = " "

local keymap = vim.keymap   -- For conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement 

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })       -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })     -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })        -- Make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })   -- Close current split window
