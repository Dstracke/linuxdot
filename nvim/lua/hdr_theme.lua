local M = {}

function M.setup()
	-- Theme Setup
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "hdr_prime"

	-- HDR-Palette (Optimiert für hohe Dynamik)
	local colors = {
		-- Hintergrund: Fast Schwarz (verhindert OLED Smearing besser als #000000)
		bg        = "#08080a",
		ibg        = "#1b1b22",
		-- Text: Ein sanftes Grau-Weiß (verhindert "Blooming" bei hoher Helligkeit)
		fg        = "#d1d1d1",
		-- Akzente: Hohe Sättigung, hohe Luminanz
		cyan      = "#00f5ff", -- Electric Cyan
		--magenta  = "#ff41f2", -- Neon Magenta
		orange    = "#ff9e64", -- Neon Magenta
		green     = "#5eff8b", -- Toxic Green
		yellow    = "#f1ff5e", -- Laser Yellow
		red       = "#ff3b3b", -- Vivid Red
		-- UI Elemente
		selection = "#222436",
		--comment   = "#444a73", -- Tiefes Blau-Grau
		comment   = "#444a63", -- Tiefes Blau-Grau
		line_nr   = "#3b4241",
	}

	local hl = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- --- UI HIGHLIGHTS ---
	hl("Normal", { fg = colors.fg, bg = colors.bg })
	hl("NormalNC", { fg = colors.fg, bg = colors.ibg })
	hl("CursorLine", { bg = "#16161e" })
	hl("LineNr", { fg = colors.line_nr })
	hl("Visual", { bg = colors.selection })
	hl("Search", { fg = colors.bg, bg = colors.cyan })
	hl("Directory", { fg = colors.orange })

	-- --- SYNTAX HIGHLIGHTS (Der HDR-Effekt) ---
	-- Keywords wirken durch 'bold' und hohe Luminanz fast wie selbstleuchtend
	hl("Keyword", { fg = colors.orange, bold = true })
	hl("Function", { fg = colors.cyan, italic = true })
	hl("String", { fg = colors.green })
	hl("Constant", { fg = colors.yellow })
	hl("Comment", { fg = colors.comment, italic = true })
	hl("Identifier", { fg = colors.fg })
	hl("Statement", { fg = colors.orange })
	hl("PreProc", { fg = colors.cyan })
	hl("Type", { fg = colors.cyan, bold = true })

	-- --- DIAGNOSTICS (Glow-Farben) ---
	hl("DiagnosticError", { fg = colors.red })
	hl("DiagnosticWarn", { fg = colors.yellow })
	hl("DiagnosticInfo", { fg = colors.cyan })
	hl("DiagnosticHint", { fg = colors.green })
end

return M
