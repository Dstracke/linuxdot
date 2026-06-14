-- lua/plugins.lua
local M = {}

M.setup = function()
	-- Das neue native System für 0.12
	-- Es erwartet eine Liste von Plugins
	vim.pack.add({
		{
			src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
			-- Die Version wird vom System geprüft
		},
		{
			src = 'https://github.com/folke/which-key.nvim'
		},
		{
			src = "https://github.com/nvim-telescope/telescope.nvim"
		},
		{
			src = "https://github.com/numtostr/comment.nvim"
		},
		{
			src = "https://github.com/echasnovski/mini.nvim"
		},
		-- dependencies
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/MunifTanjim/nui.nvim",
		"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		-- optional, but recommended
		"https://github.com/nvim-tree/nvim-web-devicons",
	})
end

return M
