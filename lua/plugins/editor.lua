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
				{
					"nvim-tree/nvim-web-devicons",
					config = function()
						require("nvim-web-devicons").setup({
							strict = true,
							override_by_extension = {
								astro = {
									icon = "󱎯",
									color = "#EF8547",
									name = "astro",
								},
							},
						})
					end,
				},
			},
		},
		keys = require("plugins.config.editor").telescope.get_keys(),
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					horizontal = { preview_cutoff = 80, preview_width = 0.55 },
					vertical = { mirror = true, preview_cutoff = 25 },
					prompt_position = "top",
					width = 0.87,
					height = 0.80,
				},
			},
		},
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
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "⍉ " or (e == "warning" and " " or " ")
						s = s .. n .. " " .. sym
					end
					return s
				end,
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
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"lukas-reineke/headlines.nvim",
		opts = {
			markdown = {
				fat_headlines = true,
			},
		},
	},
	{
		"github/copilot.vim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = false,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
				},
				ensure_installed = require("plugins.config.editor").treesitter.get_list_parser(),
			})
		end,
	},
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup({
				logo = "https://media.tenor.com/r_UXzJS2a8gAAAAM/hello-fuckwits.gif",
				logo_tooltip = "Nuh uh, it should be neovim logo, but you didn't deserve it",
				main_image = "language",
				show_time = true,
				global_time = false,
				enable_line_number = true,

				editing_text = "Editing %s",
				file_explorer_text = "Browsing in files (%s)",
				git_commit_text = "Committing changes",
				plugin_manager_text = "Managing plugins",
				reading_text = "Reading %s",
				workspace_text = "Working on %s",
				line_number_text = "Line %s out of %s",
				terminal_text = "Using Terminal",
			})
		end,
	},
}
