return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-file-browser.nvim",
				config = function()
					local telescope = require("telescope")
					local actions = require("telescope.actions")

					telescope.load_extension("file_browser")
					telescope.load_extension("fzf")

					telescope.setup({
						defaults = {
							mappings = require("plugins.config.editor").telescope.get_mappings(actions),
						},
					})
				end,
			},
			{
				"nvim-lua/plenary.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
				"nvim-tree/nvim-web-devicons",
			},
		},
		keys = require("plugins.config.editor").telescope.get_keys(),
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		opts = {
			options = {
				mode = "tabs",
				separator_style = "slant",
			},
		},
	},
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 300,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},
}
