-- lua/lsp-config.lua (gekürzt)
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

local M = {}

M.setup = function()
	local keymaps = require('keymaps')
	local on_attach = function(_, bufnr)
		keymaps.set_lsp_keys(_, bufnr)
	end
	local function start_lua_lsp()
		vim.lsp.start({
			name = 'lua_ls',
			cmd = { 'lua-language-server' },
			root_dir = vim.fn.getcwd(),
			settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
			on_attach = on_attach,
		})
	end
	local function start_pyright_lsp()
		vim.lsp.start({
			name      = 'python_lsp',
			cmd       = { 'pyright-langserver', '--stdio' },
			root_dir  = vim.fn.getcwd(),
			settings  = { Python = { diagnostics = { globals = { 'vim' } } } },
			on_attach = on_attach,
		})
	end

	vim.api.nvim_create_autocmd('FileType', {
		pattern = 'lua',
		callback = start_lua_lsp,
	})

	vim.api.nvim_create_autocmd('FileType', {
		pattern = 'python',
		callback = start_pyright_lsp,
	})
end

return M
