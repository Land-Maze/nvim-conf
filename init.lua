-- Path to modules
local script_dir = debug.getinfo(1, 'S').source:sub(2):match("(.*[/\\])")
vim.opt.rtp:prepend(script_dir)
package.path = script_dir .. "?.lua;" .. package.path

-- Import of config
require("config").setup()

-- Plugin manager
local plugin_manager = require("plugins")
plugin_manager.bootstrap()
plugin_manager.install_plugins()

