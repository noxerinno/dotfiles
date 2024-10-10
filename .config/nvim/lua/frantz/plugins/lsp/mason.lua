return {
	"williamboman/mason.nvim",

	config = function()
		-- Import mason
		local mason = require("mason")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
