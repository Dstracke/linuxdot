-- lua/keymaps.lua
local M = {}

-- 1. Diese Funktion wird EINMAL in der init.lua aufgerufen
M.setup = function()
	vim.g.mapleader = " "

	-- Allgemeine Keymaps (Immer verfügbar)
	vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Speichern" })
	vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Beenden" })
	vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = "Explorer" })

	-- Telescope (Immer verfügbar)
	local ts = function(func)
		return function() require('telescope.builtin')[func]() end
	end
	vim.keymap.set('n', '<leader>ff', ts('find_files'), { desc = "Finde Dateien" })
	vim.keymap.set('n', '<leader>fb', ts('buffers'), { desc = "Buffer" })
	vim.keymap.set('n', '<leader>fg', ts('live_grep'), { desc = "Text suchen" })
end

-- 2. DIESE Funktion wird von deiner lsp-config.lua aufgerufen (on_attach)
M.set_lsp_keys = function(_, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	opts.desc = "Gehe zu Definition"
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

	opts.desc = "Dokumentation zeigen"
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	opts.desc = "Variable umbenennen"
	vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)

	opts.desc = "Code formatieren"
	vim.keymap.set('n', '<leader>l', function()
		vim.lsp.buf.format { async = true }
	end, opts)
end

return M
