local M = {}

M.telescope = {}

function M.telescope.get_keys()
    return {
        { "<leader>fe", ":Telescope file_browser hidden=true path=%:p:h select_buffer=true<CR>" },
        { "<leader>s", "<cmd>Telescope registers<CR>"},
    }
end

return M
