local function lazy_nvim_bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)
end

local function lazy_nvim_install_plugins()
    local pluginList = require("plugins.plugins")
    local lazy = require("lazy")

    -- Setup lazy loading plugins
    lazy.setup(pluginList)
end

return {
    bootstrap = lazy_nvim_bootstrap,
    install_plugins = lazy_nvim_install_plugins
}
