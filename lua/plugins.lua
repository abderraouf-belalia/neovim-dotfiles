local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

	use("wbthomason/packer.nvim") -- Have packer manage itself

  -- A good theme.
  use("folke/tokyonight.nvim")

	-- Better display of ex-commands.
	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	-- Side panel for quick lookup at the cwd.
	use("nvim-tree/nvim-tree.lua")

	-- A protocol where everything is a buffer, even folders.
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})

	-- Better icons for the interface.
	use("nvim-tree/nvim-web-devicons")

	-- Powerful fuzzy-finder.
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Powerful syntax highlighting.
	use("nvim-treesitter/nvim-treesitter")

	-- Cool status line.
	use("nvim-lualine/lualine.nvim")

	-- All the LSP goods.
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- All of the DAP extra.
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- All the completion stuff.
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path") -- completion on paths
	use("hrsh7th/cmp-buffer") -- from the buffer
	use("hrsh7th/cmp-nvim-lua") -- from neovim lua
	use("hrsh7th/cmp-nvim-lsp") -- from the LSP
	use("saadparwaiz1/cmp_luasnip") -- from snippets
	use("b0o/schemastore.nvim") -- from known JSON files

	-- More LSP goods.
	use("onsails/lspkind.nvim") -- floating completion menu
	use("RRethy/vim-illuminate") -- inline errors and stuff

	-- Cheatsheet for quick lookups.
	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
