return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 5000
	end,
	opts = {
		-- Your configuration comes here or leave it empty to use the default settings
	},
}
