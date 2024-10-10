return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	config = function()
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"prettier", -- Prettier formatter
				"stylua", -- Lua formatter
				"isort", -- Python formatter
				"black", -- Python formatter
				"clang-format", -- C/C++ formatter
				"gofumpt", -- Go formatter
				"goimports", -- Go formatter
				"goimports-reviser", -- Go formatter

				-- Linters
				"checkstyle", -- Java linter
				-- "clangtidy", -- C/C++ linter
				"eslint_d", -- JavaScript/TypeScript linter
				"golangci-lint", -- Go linter
				"hadolint", -- Dockerfile linter
				"pylint", -- Python linter
			},
		})
	end,
}
