local function setup_configs()
	require("config.options").init()
	require("config.keybinding").init()
	require("config.mappings").init()
end

return {
	setup = setup_configs,
}
