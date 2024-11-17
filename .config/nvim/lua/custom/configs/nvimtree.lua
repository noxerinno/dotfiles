local nvimtree = require("nvim-tree")

-- Recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    git = {
		ignore = false,
	},
})

-- Set keymaps
local keymap = vim.keymap -- For conciseness

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- Toggle file explorer
keymap.set(
    "n",
    "<leader>ef",
    "<cmd>NvimTreeFindFileToggle<CR>",
    { desc = "Toggle file explorer on current file" }
)

-- Toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- Collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- Refresh file explorer
