local function setup_options_config()
    -- Syntax highlight
    vim.cmd('syntax on')

    -- Line numbers
    vim.cmd('set number')
    vim.cmd('set relativenumber')

    -- Tab width (spaces)
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    -- Mouse support
    vim.opt.mouse = 'a'
end

return {
    init = setup_options_config
}
