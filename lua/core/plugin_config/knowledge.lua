require("neorg").setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.presenter"] = {
			config = {
				zen_mode = "truezen",
			},
		},
		["core.concealer"] = {}, -- Loads default behaviour
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
	},
})

vim.opt.conceallevel = 2
