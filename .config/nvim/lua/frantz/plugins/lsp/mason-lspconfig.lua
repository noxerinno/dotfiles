return {

	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"mason.nvim",
	},

	config = function()
		-- Import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup() --{
		--   -- List of servers for mason to install
		--   ensure_installed = {
		--     "tsserver",
		--     "html",
		--     "cssls",
		--     "tailwindcss",
		--     "svelte",
		--     "lua_ls",
		--     "graphql",
		--     "emmet_ls",
		--     "prismals",
		--     "pyright",
		--   },
		-- })

		require("mason-lspconfig").setup_handlers({
			function(default_lsp_server) -- default handler (optional)
				require("lspconfig")[default_lsp_server].setup({})
			end,
		})
	end,
}
