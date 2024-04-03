local M = {}

M.cmp = {}
M.mason = {}
M.lspconfig = {}

function M.cmp.get_mappings(cmp)
	return {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}
end

function M.cmp.get_cmp_sources(cmp)
	return {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}
end

function M.mason.get_language_servers()
	return {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"pyright",
		"prismals",
		"eslint",
		"jsonls",
		"marksman",
		"yamlls",
		"dockerls",
		"docker_compose_language_service",
		"clangd",
		"bashls",
		"astro",
		"vimls",
	}
end

function M.lspconfig.get_on_attach_set_mappings()
	local keymap = vim.keymap
	local opts = { noremap = true, silent = true }

	return function(client, bufnr)
		opts.buffer = bufnr

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end
end

function M.lspconfig.get_signs()
	return {
		Error = "⍉ ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}
end

function M.lspconfig.setup_lsp_servers(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig["tsserver"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["html"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["cssls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["tailwindcss"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["lua_ls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lspconfig["pyright"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["prismals"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["eslint"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["jsonls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["marksman"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["yamlls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["dockerls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["docker_compose_language_service"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["clangd"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["bashls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["astro"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig["vimls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
