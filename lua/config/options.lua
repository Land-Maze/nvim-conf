local function setup_options_config()
	-- Syntax highlight
	vim.cmd("syntax on")

	-- Line numbers
	vim.opt.number = true
	vim.opt.relativenumber = true

	-- Tab width (spaces)
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true

	-- Mouse support
	vim.opt.mouse = "a"

	-- I am too lazy to type meaning :3
	vim.opt.wrap = false
	vim.opt.termguicolors = true
	vim.opt.smartindent = true
	vim.opt.shiftround = true

	vim.g.root_spec = {
		"lsp",
		{ ".git", "lua" },
		"cwd",
	}

	vim.opt.clipboard = "unnamedplus"
	vim.opt.conceallevel = 3
	vim.opt.spelllang = { "en" }
	vim.opt.splitkeep = "screen"
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.undofile = true
	vim.opt.showtabline = 2
	vim.opt.list = true
end

return {
	init = setup_options_config,
}
