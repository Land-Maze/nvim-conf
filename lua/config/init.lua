local function setup_configs()
	require("config.options").init()
	require("config.keybinding").init()
end

return {
	setup = setup_configs
}
