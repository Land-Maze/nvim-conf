local function get_all_plugins()
    local colorschemeList = require("plugins.colorscheme")
    local editorList = require("plugins.editor")
    local miscList = require("plugins.misc")  
    local miscLSP = require("plugins.lsp")

    local combinedList = {}

    for _, value in ipairs(colorschemeList) do
        table.insert(combinedList, value)
    end	

    for _, value in ipairs(editorList) do
        table.insert(combinedList, value)
    end	

    for _, value in ipairs(miscList) do
        table.insert(combinedList, value)
    end

    for _, value in ipairs(miscLSP) do
        table.insert(combinedList, value)
    end

    return combinedList
end

return {
	all = get_all_plugins
}
