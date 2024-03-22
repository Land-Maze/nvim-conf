local M = {}

M.telescope = {}

function M.telescope.get_keys()
    return {
        { "<leader>fe", "<cmd>Telescope file_browser hidden=true path=%:p:h select_buffer=true<CR>" },
        { "<leader>s", "<cmd>Telescope registers<CR>"},
        { "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Finds string in current working directory" } }
    }
end

function M.telescope.get_mappings(actions)
  return {
    i = {
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    }
  }
end

return M
