-- COMPLETION
local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<Enter>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "neorg" },
		{ name = "buffer", keyword_lenght = 3 },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	},
	experimental = {
		ghost_text = true,
	},
})

-- local groups =  require('colorbuddy.group').groups
-- local Group =  require('colorbuddy.group').Group
--
-- Group.new('CmptItemAbbr', groups.Comment)
-- Group.new('CmptItemAbbrDeprecated', groups.Error)
-- Group.new('CmptItemAbbrMatchFuzzy', groups.CmptItemAbbr.fg:dark(), nil, styles.italic)
-- Group.new('CmptItemKind', groups.Special)
-- Group.new('CmptItemMenu', groups.NonText)
--
--
-- LSP SERVERS
require("mason").setup()
require("mason-lspconfig").setup()

require("core.plugin_config.lsp")

-- SNIPPETS
vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
