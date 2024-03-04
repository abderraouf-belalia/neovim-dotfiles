require("lualine").setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = "",
		theme = "tokyonight",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
