require("mason").setup()
require("mason-lspconfig").setup()

local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		"pylint", -- python linter
		"pyright", -- python lsp
		"tsserver", -- lua formatter
		"eslint_d", -- js linter
		"bashls", -- bash lsp
		"cssls", -- css lsp
		"emmet-ls", -- emmet lsp
		"jsonls", -- json lsp
		"graphql", -- graphql lsp
		"solc", -- solidity lsp
	},
})
