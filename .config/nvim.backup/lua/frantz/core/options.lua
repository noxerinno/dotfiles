vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- For conciseness

opt.relativenumber = true
opt.number = true

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
