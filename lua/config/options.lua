local function setup_options_config()
    -- Syntax highlight
    vim.cmd('syntax on')

    -- Line numbers
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- Tab width (spaces)
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true

    -- Mouse support
    vim.opt.mouse = 'a'

    vim.opt.wrap = false
    vim.opt.termguicolors = true
    vim.opt.smartindent = true
    vim.opt.shiftround = true

end

return {
    init = setup_options_config
}
