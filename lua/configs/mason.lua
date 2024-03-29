require("mason").setup()
require("mason-lspconfig").setup()

local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })
