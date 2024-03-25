local function setup_mappings()
	local map = vim.keymap.set

	-- Move Lines
	map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
	map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
	map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
	map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
	map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
	map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

	-- new file
	map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

	-- better indenting
	map("v", "<", "< gv")
	map("v", ">", "> gv")

	-- better up/down
	map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
	map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
	map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
	map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

	-- Move to window using the <ctrl> hjkl keys
	map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
	map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
	map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
	map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

	-- Resize window using <ctrl> arrow keys
	map("n", "∆", "<cmd>resize +2<cr>", { desc = "Increase window height" })
	map("n", "˚", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
	map("n", "˙", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
	map("n", "¬", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
	map("n", "<Leader>=", "<C-w>=", { desc = "Set all window to same size." })

	-- buffers
	map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
	map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
	map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
	map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
end

return {
	init = setup_mappings,
}
