-- Einstellungen
vim.opt.mouse = "a"           -- Mausunterstützung
vim.opt.number = true         -- Zeilennummern
vim.opt.relativenumber = true -- Relative Zeilennummern
vim.opt.autocomplete = true
vim.opt.pumblend = 10         -- Tranzparenz fürs neue Popup Menu
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.laststatus = 3

-- Module
require('vim._core.ui2').enable()
require('keymaps').setup()    -- Erst die Tasten definieren
require('lsp-config').setup() -- Dann den LSP konfigurieren
require('plugins').setup()    -- Plugins
require('mini.cmdline').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.icons').setup()
local statusline = require('mini.statusline')

statusline.setup({
	content = {
		active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git           = statusline.section_git({ trunc_width = 75 })
			local filename      = statusline.section_filename({ trunc_width = 140 })
			local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
			local time          = os.date("%H:%M")

			return statusline.combine_groups({
				{ hl = mode_hl,                 strings = { mode } },
				{ hl = 'MiniStatuslineDevinfo', strings = { git } },
				'%<',
				{ hl = 'MiniStatuslineFilename', strings = { filename } },
				'%=',
				{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
				'%>',
				{ hl = mode_hl, strings = { time } },
			})
		end,
	},
})
-- require('mini.clue').setup()

-- WICHTIG für HDR/TrueColor Support
vim.opt.termguicolors = true
local hdr = require("hdr_theme")
hdr.setup();
