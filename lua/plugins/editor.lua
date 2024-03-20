return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            {
                "nvim-telescope/telescope-file-browser.nvim",
                config = function()
                    require("telescope").load_extension("file_browser")
                end,
            },
            {
                "nvim-lua/plenary.nvim"
            }
        },
	      keys = require("plugins.config.editor").telescope.get_keys()
    }
}
