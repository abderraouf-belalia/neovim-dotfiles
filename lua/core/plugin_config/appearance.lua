vim.o.background = "dark"

-- default config
require("solarized").setup({
	transparent = true, -- enable transparent background
	styles = {
		comments = { italic = true },
		functions = {},
		variables = {},
		numbers = {},
		constants = {},
		parameters = {},
		keywords = {},
		types = {},
	},
	enables = {
		cmp = false,
		treesitter = false,
	},
	theme = "default",
})

vim.cmd.colorscheme = "solarized"
