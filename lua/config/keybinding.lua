local function setup_keybinding()
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"
end

return {
    init = setup_keybinding
}
