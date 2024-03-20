-- Path to modules
local script_dir = debug.getinfo(1, 'S').source:sub(2):match("(.*[/\\])")
vim.opt.rtp:prepend(script_dir)
package.path = script_dir .. "?.lua;" .. package.path


-- Import basic config
require("config.basic").setup()

-- Import vim keybindings
require("config.keybinding").setup()
