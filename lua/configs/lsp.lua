local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
	buf_set_keymap("n", "H", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts) --> renaname old_fname to new_fname
	buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts) --> formats the current buffer
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
})

require("lspconfig")["solc"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["graphql"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["jsonls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
