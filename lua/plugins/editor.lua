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
                      mappings = require("plugins.config.editor").telescope.get_mappings(actions)
                    }
                  })
                end,
            },
            {
                "nvim-lua/plenary.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
                "nvim-tree/nvim-web-devicons"
            }
        },
	      keys = require("plugins.config.editor").telescope.get_keys()
    }
}
