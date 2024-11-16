return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	after = { "mason", "mason-lspconfig" },

	config = function()
		-- Import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- Import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- Import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- For conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- See available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Mapping to restart lsp if necessary
			end,
		})

		-- Used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- Configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				-- Configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- Configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- Configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- Make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,

			-- Trying to add clang-tidy linter to Mason linter list
			["clangd"] = function()
				-- Configure clangd server (with special settings)
				lspconfig["clangd"].setup({
					cmd = {
						"clangd",
						"--fallback-style=webkit",
						-- "--background-index",
						-- "-j=12",
						-- "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
						-- "--clang-tidy",
						-- "--clang-tidy-checks=*",
						-- "--all-scopes-completion",
						-- "--cross-file-rename",
						-- "--completion-style=detailed",
						-- "--header-insertion-decorators",
						-- "--header-insertion=iwyu",
						-- "--pch-storage=memory",
					},
				})
			end,
			-- Configure textlsp
			["textlsp"] = function()
				lspconfig["textlsp"].setup({
					capabilities = capabilities,
					filetypes = {
						"markdown",
						"json",
						"yaml",
					},
					on_attach = function(client, bufnr)
						-- Autocommande to disable textlsp for .txt files
						vim.api.nvim_create_autocmd("FileType", {
							pattern = "*.txt",
							callback = function()
								-- Check if the client is `textlsp`, if so disable it
								if client.name == "textlsp" then
									client.stop()
								end
							end,
						})
					end,
				})
			end,
		})
	end,
}
