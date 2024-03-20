local function setup_basic_config()
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

    -- Colorscheme
    vim.cmd('colorscheme darkblue')
end

return {
    setup = setup_basic_config
}
