local M = {}

-- Define the custom function
function M.CustomColourscheme(color)
	-- Clear existing highlights
	vim.cmd("hi clear")
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "cTodo" , { bg = "NONE" })
	vim.api.nvim_set_hl(0, "Todo" , { bg = "NONE" })

	if color == "miniwinter" then
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Cursor" , { bg = "#40ff40" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#000000" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#101010" })
		--vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#101010" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#0a0a0a" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "kanso" or color == "kanso-ink" or color == "kanso-zen" then
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "@comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Cursor" , { bg = "#40ff40" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#101010" })
		--vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#101010" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "kanagawa" or color == "kanagawa-wave" then
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "@comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "kintsugi-dark" then
		-- Using vim.api.nvim_set_hl is more efficient than using vim.cmd
		-- because when vim.cmd is used it has to string parse the args 
		-- and pass them to the hilight function, whereas the api call
		-- it only has to pass a lua table
		vim.api.nvim_set_hl(0, "Comment", { fg = "#727169" })
		vim.api.nvim_set_hl(0, "@comment", { fg = "#727169" })
		vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#dfdf8e" })
		vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "@type", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "@function", { fg = "#71ade7" })
		vim.api.nvim_set_hl(0, "@function.call", { fg = "#7aade7" })
		vim.api.nvim_set_hl(0, "@operator", { fg = "#708b8d" })
		vim.api.nvim_set_hl(0, "Normal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#050505" }) -- This is also the background of the default splash screen
		vim.api.nvim_set_hl(0, "MsgArea", { bg = "#050505" }) -- Command/Message area below the statusline
		vim.api.nvim_set_hl(0, "Cursor", { bg = "#40ff40" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "#050505", fg = "#444444" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "#050505", fg = "#444444" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#939799" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#dbad49", fg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = "#161f20" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", { bg = "#151515" })
		vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#050505" })
 		end

	if color == "koda-moss" or color == "koda-dark" then
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "@comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Cursor" , { bg = "#40ff40" ,  fg = "#101010" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#151515" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "gruber-darker" then
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "@comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "LineNrAbove" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "LineNrBelow" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "MatchParen" , { bg = "#777777" })
		vim.api.nvim_set_hl(0, "Delimiter" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal" , { fg = "#252525" ,  bg = "#FFA717" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#151515" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "jellybeans" then
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "@lsp.type.variable" , { fg = "#e8e8d3" })
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#111155" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniPickNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniPickBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniPickPrompt" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniNotifyNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniNotifyBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniFilesNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#151515" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "melange" then
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "CursorLine" , { bg = "#111155" })
		vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#6f7b68" })
		vim.api.nvim_set_hl(0, "LineNrAbove" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "LineNrBelow" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "MatchParen" , { bg = "#999999" ,  fg = "#303030" })
		vim.api.nvim_set_hl(0, "Delimiter" , { fg = "#666666" })
		vim.api.nvim_set_hl(0, "MiniPickNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniPickBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniPickPrompt" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniNotifyNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniNotifyBorder" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniFilesNormal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#050505" ,  fg = "#FFA717" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })

	end

	if color == "naysayer" then
		--vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "TelescopeNormal" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "TelescopeBorder" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniPickNormal" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniPickBorder" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniPickPrompt" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniNotifyNormal" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniNotifyBorder" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniFilesNormal" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#151515" })
		--vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		--vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "lodestone" then
		vim.api.nvim_set_hl(0, "Special" , { fg = "#87919D" })
		vim.api.nvim_set_hl(0, "Operator" , { fg = "#87919D" })
		vim.api.nvim_set_hl(0, "Delimiter" , { fg = "#87919D" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineCurrent" , { bg = "#151515" })
		vim.api.nvim_set_hl(0, "MiniTablineFill" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineHidden" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineVisible" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible" , { bg = "#050505" })
	end

	if color == "oshen-night" then
		vim.api.nvim_set_hl(0, "Normal" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "NormalNC" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "Comment" , { fg = "#87919d" })
		vim.api.nvim_set_hl(0, "@comment" , { fg = "#87919d" })
		vim.api.nvim_set_hl(0, "@lsp.type.comment" , { fg = "#87919d" })
		--vim.api.nvim_set_hl(0, "LineNr" , { bg = "#050505" })
		vim.api.nvim_set_hl(0, "LineNrAbove" , { fg = "#87919d" })
		vim.api.nvim_set_hl(0, "LineNrBelow" , { fg = "#87919d" })
		--vim.cmd'hi TabLine" , { fg = "#e6dbd1'
		--vim.cmd'hi TabLineNC" , { fg = "#151515'
		--vim.cmd'hi CursorLine" , { bg = "#111144'
		--vim.api.nvim_set_hl(0, "Cursor" , { bg = "#00ff33" , { fg = "#303030" })
		--vim.api.nvim_set_hl(0, "cTodo" , { bg = "#121212" })
	end

	-- an attempt to remove italics from all themes
	-- TODO: Better way to do this
	local hl_groups = vim.api.nvim_get_hl(0, {})

	for key, hl_group in pairs(hl_groups) do
		if hl_group.italic then
			vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
		end
	end
end

return M
