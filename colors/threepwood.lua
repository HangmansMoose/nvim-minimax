-- threepwood.lua
-- A standalone, dependency-free colorscheme derived from the palette of
-- kintsugi-dark (metalelf0/kintsugi-nvim, itself a port of @ahatem's
-- VSCode "Kintsugi" theme), with personal overrides baked directly in.
--
-- No plugin dependency: this file vendors the palette and highlight
-- groups it needs, covering: core editor UI, legacy syntax groups,
-- Tree-sitter captures, LSP semantic tokens/diagnostics, Telescope,
-- and the mini.nvim family.
--
-- Install: place this file at
--   ~/.config/nvim/colors/threepwood.lua        (Linux/macOS)
--   %LOCALAPPDATA%\nvim\colors\threepwood.lua    (Windows)
-- then run :colorscheme threepwood

if vim.g.colors_name then
	vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "threepwood"

---------------------------------------------------------------------------
-- Palette (from kintsugi-dark; bg overridden to near-black throughout)
---------------------------------------------------------------------------

local p = {
	-- Backgrounds
	bg = "#050505",
	bg_dark = "#050505",
	bg_alt = "#1a1a1d",
	bg_line = "#050505",
	bg_float = "#050505",
	bg_hover = "#1c1c1c",
	bg_menu_sel = "#393b31",
	bg_menu_inact = "#32332b",
	bg_dropdown = "#20201f",

	-- Borders
	border = "#939799",
	border_strong = "#3a3a37",

	-- Foregrounds
	fg = "#dddddd",
	fg_dim = "#c9c4b8",
	fg_dim2 = "#969b8c",
	fg_mute = "#75715e",
	fg_gutter = "#444444",
	fg_line_active = "#b4aa60",
	fg_invisible = "#464741",

	-- Accents
	cursor = "#40ff40",
	accent = "#dbad49",

	-- Semantic / diagnostic
	green = "#a3be8c",
	red = "#b38f8f",
	yellow = "#ebcb8b",
	blue_bright = "#8fa3b3",
	magenta = "#b3a3d3",

	black = "#000000",

	syntax = {
		default = "#dddddd",
		comment = "#727169", -- overridden (was #af9661)
		string = "#98c379",
		number = "#819aff",
		keyword = "#dbad49",
		type = "#708b8d", -- overridden (was #939799)
		enum_member = "#dfdf8e", -- overridden (was #939799)
		annotation = "#678e87",
		invalid = "#b38f8f",
		punctuation = "#868165",
		operator = "#708b8d", -- overridden (was #dddddd)
		storage = "#dbad49",
		self_kw = "#dbad49",
		func = "#71ade7", -- overridden (was #dddddd)
		func_call = "#7aade7",
		constant = "#939799",
		markup_raw = "#939799",
		link = "#8fa3b3",
	},
}

local s = p.syntax

---------------------------------------------------------------------------
-- Highlight table
---------------------------------------------------------------------------

local hi = {}

-- Core editor UI ----------------------------------------------------------
hi.Normal = { fg = p.fg, bg = p.bg }
hi.NormalNC = { fg = p.fg, bg = p.bg }
hi.NormalFloat = { fg = p.fg_dim, bg = p.bg_float }
hi.FloatBorder = { fg = p.border, bg = p.bg_float }
hi.FloatTitle = { fg = p.accent, bg = p.bg_float, bold = true }
hi.SignColumn = { fg = p.fg_gutter, bg = p.bg }
hi.EndOfBuffer = { fg = p.bg, bg = p.bg }
hi.MsgArea = { fg = p.fg, bg = p.bg }
hi.MsgSeparator = { fg = p.border, bg = p.bg }
hi.ModeMsg = { fg = p.fg, bold = true }
hi.MoreMsg = { fg = p.accent }
hi.WarningMsg = { fg = p.yellow }
hi.ErrorMsg = { fg = p.red }
hi.Question = { fg = p.accent }

hi.Cursor = { fg = p.bg, bg = p.cursor }
hi.lCursor = { fg = p.bg, bg = p.cursor }
hi.CursorIM = { fg = p.bg, bg = p.cursor }
hi.TermCursor = { fg = p.bg, bg = p.cursor }
hi.CursorLine = { bg = p.bg_line }
hi.CursorColumn = { bg = p.bg_line }
hi.ColorColumn = { bg = p.bg_line }
hi.LineNr = { fg = p.fg_gutter, bg = p.bg }
hi.LineNrAbove = { fg = p.fg_gutter, bg = p.bg }
hi.LineNrBelow = { fg = p.fg_gutter, bg = p.bg }
hi.CursorLineNr = { fg = p.fg_line_active, bg = p.bg_line, bold = true }

hi.FoldColumn = { fg = p.fg_gutter, bg = p.bg }
hi.Folded = { fg = p.fg_dim, bg = p.bg_hover }
hi.VertSplit = { fg = p.border, bg = p.bg }
hi.WinSeparator = { fg = p.border, bg = p.bg, bold = true }
hi.WinBar = { fg = p.fg_dim, bg = p.bg }
hi.WinBarNC = { fg = p.fg_mute, bg = p.bg }

hi.Visual = { bg = p.bg_menu_inact }
hi.VisualNOS = { bg = p.bg_menu_inact }
hi.Search = { fg = p.fg, bg = "#1f2733" }
hi.IncSearch = { fg = p.bg, bg = p.accent, bold = true }
hi.CurSearch = { fg = p.bg, bg = p.accent, bold = true }
hi.Substitute = { fg = p.bg, bg = p.yellow, bold = true }
hi.MatchParen = { fg = p.accent, bg = "#2a2f3a", bold = true }

hi.Whitespace = { fg = p.fg_invisible }
hi.NonText = { fg = p.fg_invisible }
hi.SpecialKey = { fg = p.fg_invisible }
hi.Conceal = { fg = p.fg_mute }

hi.StatusLine = { fg = p.fg_dim2, bg = p.bg_dark }
hi.StatusLineNC = { fg = p.fg_mute, bg = p.bg_dark }

hi.TabLine = { fg = p.fg_dim, bg = p.bg_alt }
hi.TabLineFill = { fg = p.fg_mute, bg = p.bg_dark }
hi.TabLineSel = { fg = p.fg, bg = p.bg, bold = true }

hi.Title = { fg = p.accent, bold = true }
hi.Directory = { fg = p.accent }

hi.Pmenu = { fg = p.fg_dim, bg = p.bg_float }
hi.PmenuSel = { fg = p.fg, bg = p.bg_menu_sel, bold = true }
hi.PmenuKind = { fg = s.type, bg = p.bg_float }
hi.PmenuKindSel = { fg = s.type, bg = p.bg_menu_sel, bold = true }
hi.PmenuExtra = { fg = p.fg_mute, bg = p.bg_float }
hi.PmenuExtraSel = { fg = p.fg_mute, bg = p.bg_menu_sel }
hi.PmenuSbar = { bg = p.bg_dropdown }
hi.PmenuThumb = { bg = p.fg_mute }
hi.WildMenu = { fg = p.fg, bg = p.bg_menu_sel }

hi.QuickFixLine = { bg = p.bg_menu_inact, bold = true }

hi.SpellBad = { sp = p.red, undercurl = true }
hi.SpellCap = { sp = p.blue_bright, undercurl = true }
hi.SpellLocal = { sp = "#6ac6f2", undercurl = true }
hi.SpellRare = { sp = p.magenta, undercurl = true }

hi.Debug = { fg = p.yellow }
hi.healthError = { fg = p.red }
hi.healthSuccess = { fg = p.green }
hi.healthWarning = { fg = p.yellow }

-- Legacy syntax groups (non-treesitter fallback) ---------------------------
hi.Comment = { fg = s.comment, italic = false }
hi.Constant = { fg = s.constant }
hi.String = { fg = s.string }
hi.Character = { fg = s.string }
hi.Number = { fg = s.number }
hi.Float = { fg = s.number }
hi.Boolean = { fg = s.number }
hi.Identifier = { fg = s.default }
hi.Function = { fg = s.func }
hi.Statement = { fg = s.keyword, bold = true }
hi.Conditional = { fg = s.keyword, bold = true }
hi.Repeat = { fg = s.keyword, bold = true }
hi.Label = { fg = s.keyword, bold = true }
hi.Operator = { fg = s.operator }
hi.Keyword = { fg = s.keyword, bold = true }
hi.Exception = { fg = s.keyword, bold = true }
hi.PreProc = { fg = s.keyword, bold = true }
hi.Include = { fg = s.keyword, bold = true }
hi.Define = { fg = s.keyword, bold = true }
hi.Macro = { fg = s.default }
hi.PreCondit = { fg = s.keyword, bold = true }
hi.Type = { fg = s.type }
hi.StorageClass = { fg = s.storage, bold = true }
hi.Structure = { fg = s.type }
hi.Typedef = { fg = s.type }
hi.Special = { fg = s.type }
hi.SpecialChar = { fg = s.annotation }
hi.Tag = { fg = s.storage, bold = true }
hi.Delimiter = { fg = s.punctuation }
hi.SpecialComment = { fg = s.comment, bold = true }
hi.Underlined = { fg = s.link, underline = true }
hi.Ignore = { fg = p.fg_mute }
hi.Error = { fg = s.invalid, bold = true }
hi.Todo = { fg = p.bg, bg = p.accent, bold = true }

-- Tree-sitter captures ------------------------------------------------------
hi["@comment"] = { fg = s.comment }
hi["@comment.documentation"] = { fg = s.comment, italic = false }
hi["@comment.error"] = { fg = p.red }
hi["@comment.warning"] = { fg = p.yellow }
hi["@comment.todo"] = { fg = p.bg, bg = p.accent, bold = true }
hi["@comment.note"] = { fg = p.bg, bg = p.blue_bright, bold = true }

hi["@punctuation"] = { fg = s.punctuation }
hi["@punctuation.delimiter"] = { fg = s.punctuation }
hi["@punctuation.bracket"] = { fg = s.punctuation }
hi["@punctuation.special"] = { fg = s.punctuation }

hi["@constant"] = { fg = s.constant }
hi["@constant.builtin"] = { fg = s.constant }
hi["@constant.macro"] = { fg = s.keyword, bold = true }

hi["@string"] = { fg = s.string }
hi["@string.documentation"] = { fg = s.string, italic = true }
hi["@string.regexp"] = { fg = s.annotation }
hi["@string.escape"] = { fg = s.annotation }
hi["@string.special"] = { fg = s.annotation }
hi["@string.special.path"] = { fg = s.link, underline = true }
hi["@string.special.symbol"] = { fg = s.constant }
hi["@string.special.url"] = { fg = s.link, underline = true }

hi["@character"] = { fg = s.string }
hi["@character.special"] = { fg = s.annotation }

hi["@number"] = { fg = s.number }
hi["@number.float"] = { fg = s.number }
hi["@boolean"] = { fg = s.number }

hi["@variable"] = { fg = s.default }
hi["@variable.builtin"] = { fg = s.self_kw, bold = true }
hi["@variable.parameter"] = { fg = s.default }
hi["@variable.member"] = { fg = s.default }
hi["@property"] = { fg = s.default }
hi["@field"] = { fg = s.default }

hi["@function"] = { fg = s.func }
hi["@function.builtin"] = { fg = s.func }
hi["@function.call"] = { fg = s.func_call }
hi["@function.macro"] = { fg = s.default }
hi["@function.method"] = { fg = s.func }
hi["@function.method.call"] = { fg = s.func }
hi["@function.decorator"] = { fg = s.annotation }

hi["@constructor"] = { fg = s.type }
hi["@parameter"] = { fg = s.default }

hi["@keyword"] = { fg = s.keyword, bold = true }
hi["@keyword.function"] = { fg = s.keyword, bold = true }
hi["@keyword.operator"] = { fg = s.operator }
hi["@keyword.import"] = { fg = s.keyword, bold = true }
hi["@keyword.type"] = { fg = s.storage, bold = true }
hi["@keyword.modifier"] = { fg = s.storage, bold = true }
hi["@keyword.repeat"] = { fg = s.keyword, bold = true }
hi["@keyword.return"] = { fg = s.keyword, bold = true }
hi["@keyword.debug"] = { fg = s.keyword, bold = true }
hi["@keyword.exception"] = { fg = s.keyword, bold = true }
hi["@keyword.conditional"] = { fg = s.keyword, bold = true }
hi["@keyword.conditional.ternary"] = { fg = s.operator }
hi["@keyword.directive"] = { fg = s.keyword, bold = true }
hi["@keyword.directive.define"] = { fg = s.keyword, bold = true }
hi["@keyword.storage"] = { fg = s.storage, bold = true }
hi["@keyword.coroutine"] = { fg = s.keyword, bold = true }

hi["@operator"] = { fg = s.operator }

hi["@type"] = { fg = s.type }
hi["@type.builtin"] = { fg = s.type }
hi["@type.definition"] = { fg = s.type }
hi["@type.qualifier"] = { fg = s.storage, bold = true }

hi["@attribute"] = { fg = s.annotation }
hi["@attribute.builtin"] = { fg = s.annotation }

hi["@tag"] = { fg = s.storage, bold = true }
hi["@tag.builtin"] = { fg = s.storage, bold = true }
hi["@tag.attribute"] = { fg = s.type }
hi["@tag.delimiter"] = { fg = s.punctuation }

hi["@label"] = { fg = s.keyword, bold = true }

hi["@module"] = { fg = s.type }
hi["@module.builtin"] = { fg = s.type }
hi["@namespace"] = { fg = s.type }

hi["@markup"] = { fg = s.default }
hi["@markup.strong"] = { fg = p.fg, bold = true }
hi["@markup.emphasis"] = { fg = p.fg, italic = true }
hi["@markup.italic"] = { italic = true }
hi["@markup.strikethrough"] = { strikethrough = true }
hi["@markup.underline"] = { underline = true }
hi["@markup.heading"] = { fg = s.storage, bold = true }
hi["@markup.heading.1"] = { fg = s.storage, bold = true }
hi["@markup.heading.2"] = { fg = s.storage, bold = true }
hi["@markup.heading.3"] = { fg = s.keyword, bold = true }
hi["@markup.heading.4"] = { fg = s.keyword, bold = true }
hi["@markup.heading.5"] = { fg = s.type }
hi["@markup.heading.6"] = { fg = s.type }
hi["@markup.quote"] = { fg = p.fg_mute, italic = true }
hi["@markup.math"] = { fg = s.number }
hi["@markup.link"] = { fg = s.link, underline = true }
hi["@markup.link.label"] = { fg = s.link }
hi["@markup.link.url"] = { fg = s.link, underline = true }
hi["@markup.raw"] = { fg = s.markup_raw }
hi["@markup.raw.block"] = { fg = s.markup_raw }
hi["@markup.list"] = { fg = s.keyword }
hi["@markup.list.checked"] = { fg = p.green }
hi["@markup.list.unchecked"] = { fg = p.fg_mute }

hi["@diff.plus"] = { fg = p.green }
hi["@diff.minus"] = { fg = p.red }
hi["@diff.delta"] = { fg = p.yellow }

-- LSP semantic tokens / diagnostics ----------------------------------------
hi.LspReferenceText = { bg = p.bg_menu_inact }
hi.LspReferenceRead = { bg = p.bg_menu_inact }
hi.LspReferenceWrite = { bg = p.bg_menu_sel, underline = true }
hi.LspReferenceTarget = { bg = p.bg_menu_inact }
hi.LspSignatureActiveParameter = { fg = p.accent, bold = true }
hi.LspInlayHint = { fg = p.accent, bg = p.border_strong, italic = true }
hi.LspCodeLens = { fg = p.fg_mute, italic = true }
hi.LspCodeLensSeparator = { fg = p.fg_mute }
hi.LspInfoBorder = { fg = p.border, bg = p.bg_float }

hi["@lsp.type.class"] = { fg = s.type }
hi["@lsp.type.comment"] = {}
hi["@lsp.type.decorator"] = { fg = s.annotation }
hi["@lsp.type.enum"] = { fg = s.type }
hi["@lsp.type.enumMember"] = { fg = s.enum_member }
hi["@lsp.type.event"] = { fg = s.type }
hi["@lsp.type.function"] = { fg = s.func }
hi["@lsp.type.interface"] = { fg = s.type }
hi["@lsp.type.keyword"] = { fg = s.keyword, bold = true }
hi["@lsp.type.macro"] = { fg = s.default }
hi["@lsp.type.method"] = { fg = s.func }
hi["@lsp.type.modifier"] = { fg = s.storage, bold = true }
hi["@lsp.type.namespace"] = { fg = s.type }
hi["@lsp.type.number"] = { fg = s.number }
hi["@lsp.type.operator"] = { fg = s.operator }
hi["@lsp.type.parameter"] = { fg = s.default }
hi["@lsp.type.property"] = { fg = s.default }
hi["@lsp.type.regexp"] = { fg = s.annotation }
hi["@lsp.type.string"] = { fg = s.string }
hi["@lsp.type.struct"] = { fg = s.type }
hi["@lsp.type.type"] = { fg = s.type }
hi["@lsp.type.typeParameter"] = { fg = s.type }
hi["@lsp.type.variable"] = { fg = s.default }
hi["@lsp.typemod.function.defaultLibrary"] = { fg = s.func }
hi["@lsp.typemod.method.defaultLibrary"] = { fg = s.func }
hi["@lsp.typemod.variable.defaultLibrary"] = { fg = s.self_kw, bold = true }
hi["@lsp.typemod.type.defaultLibrary"] = { fg = s.type }
hi["@lsp.typemod.class.defaultLibrary"] = { fg = s.type }
hi["@lsp.typemod.keyword.controlFlow"] = { fg = s.keyword, bold = true }
hi["@lsp.typemod.keyword.documentation"] = { fg = s.keyword, bold = true }
hi["@lsp.typemod.parameter.declaration"] = { fg = s.default }
hi["@lsp.typemod.variable.readonly"] = { fg = s.constant }
hi["@lsp.typemod.variable.readonly.defaultLibrary"] = { fg = s.constant }

hi.DiagnosticError = { fg = p.red }
hi.DiagnosticWarn = { fg = p.yellow }
hi.DiagnosticInfo = { fg = p.blue_bright }
hi.DiagnosticHint = { fg = p.green }
hi.DiagnosticOk = { fg = p.green }
hi.DiagnosticSignError = { fg = p.red, bg = p.bg }
hi.DiagnosticSignWarn = { fg = p.yellow, bg = p.bg }
hi.DiagnosticSignInfo = { fg = p.blue_bright, bg = p.bg }
hi.DiagnosticSignHint = { fg = p.green, bg = p.bg }
hi.DiagnosticSignOk = { fg = p.green, bg = p.bg }
hi.DiagnosticVirtualTextError = { fg = p.red, bg = "NONE", italic = true }
hi.DiagnosticVirtualTextWarn = { fg = p.yellow, bg = "NONE", italic = true }
hi.DiagnosticVirtualTextInfo = { fg = p.blue_bright, bg = "NONE", italic = true }
hi.DiagnosticVirtualTextHint = { fg = p.green, bg = "NONE", italic = true }
hi.DiagnosticVirtualTextOk = { fg = p.green, bg = "NONE", italic = true }
hi.DiagnosticUnderlineError = { sp = p.red, undercurl = true }
hi.DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true }
hi.DiagnosticUnderlineInfo = { sp = p.blue_bright, undercurl = true }
hi.DiagnosticUnderlineHint = { sp = p.green, undercurl = true }
hi.DiagnosticUnderlineOk = { sp = p.green, undercurl = true }
hi.DiagnosticFloatingError = { fg = p.red, bg = p.bg_float }
hi.DiagnosticFloatingWarn = { fg = p.yellow, bg = p.bg_float }
hi.DiagnosticFloatingInfo = { fg = p.blue_bright, bg = p.bg_float }
hi.DiagnosticFloatingHint = { fg = p.green, bg = p.bg_float }
hi.DiagnosticFloatingOk = { fg = p.green, bg = p.bg_float }
hi.DiagnosticDeprecated = { fg = p.fg_mute, strikethrough = true }
hi.DiagnosticUnnecessary = { fg = p.fg_mute, italic = true }

-- Telescope ------------------------------------------------------------
hi.TelescopeNormal = { fg = p.fg_dim, bg = p.bg }
hi.TelescopeBorder = { fg = p.border, bg = p.bg }
hi.TelescopePromptNormal = { fg = p.fg, bg = p.bg_dropdown }
hi.TelescopePromptBorder = { fg = p.border, bg = p.bg_dropdown }
hi.TelescopePromptTitle = { fg = p.bg, bg = p.accent, bold = true }
hi.TelescopePromptPrefix = { fg = p.accent, bg = p.bg_dropdown }
hi.TelescopePromptCounter = { fg = p.fg_mute, bg = p.bg_dropdown }
hi.TelescopeResultsNormal = { fg = p.fg_dim, bg = p.bg }
hi.TelescopeResultsBorder = { fg = p.border, bg = p.bg }
hi.TelescopeResultsTitle = { fg = p.bg, bg = p.accent }
hi.TelescopePreviewNormal = { fg = p.fg_dim, bg = p.bg }
hi.TelescopePreviewBorder = { fg = p.border, bg = p.bg }
hi.TelescopePreviewTitle = { fg = p.bg, bg = p.green, bold = true }
hi.TelescopeSelection = { fg = p.fg, bg = p.bg_menu_sel, bold = true }
hi.TelescopeSelectionCaret = { fg = p.accent, bg = p.bg_menu_sel }
hi.TelescopeMultiSelection = { fg = p.accent }
hi.TelescopeMultiIcon = { fg = p.accent }
hi.TelescopeMatching = { fg = p.accent, bold = true }
hi.TelescopeResultsDiffAdd = { fg = p.green }
hi.TelescopeResultsDiffChange = { fg = p.yellow }
hi.TelescopeResultsDiffDelete = { fg = p.red }
hi.TelescopeResultsDiffUntracked = { fg = p.green }
hi.TelescopeResultsClass = { fg = s.type }
hi.TelescopeResultsField = { fg = s.default }
hi.TelescopeResultsFunction = { fg = s.func }
hi.TelescopeResultsMethod = { fg = s.func }
hi.TelescopeResultsVariable = { fg = s.default }
hi.TelescopeResultsComment = { fg = s.comment }
hi.TelescopeResultsLineNr = { fg = p.fg_mute }

-- mini.nvim family -------------------------------------------------------
hi.MiniCursorword = { bg = p.bg_menu_inact }
hi.MiniCursorwordCurrent = { bg = p.bg_menu_inact }
hi.MiniIndentscopeSymbol = { fg = p.fg_mute }
hi.MiniIndentscopeSymbolOff = { fg = p.fg_gutter }

hi.MiniStatuslineModeNormal = { fg = p.bg, bg = p.accent, bold = true }
hi.MiniStatuslineModeInsert = { fg = p.bg, bg = p.green, bold = true }
hi.MiniStatuslineModeVisual = { fg = p.bg, bg = p.magenta, bold = true }
hi.MiniStatuslineModeReplace = { fg = p.bg, bg = p.red, bold = true }
hi.MiniStatuslineModeCommand = { fg = p.bg, bg = p.yellow, bold = true }
hi.MiniStatuslineModeOther = { fg = p.bg, bg = "#6ac6f2", bold = true }
hi.MiniStatuslineDevinfo = { fg = p.fg_dim, bg = "#161f20" } -- overridden
hi.MiniStatuslineFilename = { fg = p.fg_dim2, bg = p.bg }
hi.MiniStatuslineFileinfo = { fg = p.fg_dim, bg = p.bg_dropdown }
hi.MiniStatuslineInactive = { fg = p.fg_mute, bg = p.bg }

hi.MiniTablineCurrent = { fg = p.fg, bg = "#151515", bold = true } -- overridden
hi.MiniTablineVisible = { fg = p.fg_dim, bg = p.bg }
hi.MiniTablineHidden = { fg = p.fg_mute, bg = p.bg }
hi.MiniTablineModifiedCurrent = { fg = p.yellow, bg = "#151515", bold = true }
hi.MiniTablineModifiedVisible = { fg = p.yellow, bg = p.bg }
hi.MiniTablineModifiedHidden = { fg = p.yellow, bg = p.bg }
hi.MiniTablineFill = { bg = p.bg }
hi.MiniTablineTabpagesection = { fg = p.fg, bg = p.bg_dropdown, bold = true }

hi.MiniPickNormal = { fg = p.fg_dim, bg = p.bg }
hi.MiniPickBorder = { fg = p.border, bg = p.bg }
hi.MiniPickBorderText = { fg = p.accent, bold = true }
hi.MiniPickBorderBusy = { fg = p.yellow }
hi.MiniPickPrompt = { fg = p.accent, bold = true }
hi.MiniPickPromptCaret = { fg = p.accent }
hi.MiniPickPromptPrefix = { fg = p.accent, bg = p.bg_dropdown }
hi.MiniPickMatchCurrent = { bg = p.bg_menu_sel, bold = true }
hi.MiniPickMatchMarked = { bg = p.bg_menu_inact }
hi.MiniPickMatchRanges = { fg = p.accent, bold = true }
hi.MiniPickHeader = { fg = p.fg_dim2 }
hi.MiniPickIconDirectory = { fg = p.accent }
hi.MiniPickIconFile = { fg = p.fg_dim }
hi.MiniPickPreviewLine = { bg = p.bg_menu_sel }
hi.MiniPickPreviewRegion = { bg = p.bg_menu_inact }

hi.MiniNotifyNormal = { fg = p.fg_dim, bg = p.bg }
hi.MiniNotifyBorder = { fg = p.border, bg = p.bg }
hi.MiniNotifyTitle = { fg = p.accent, bold = true }

hi.MiniFilesNormal = { fg = p.fg_dim, bg = p.bg }
hi.MiniFilesBorder = { fg = p.border, bg = p.bg }
hi.MiniFilesBorderModified = { fg = p.yellow, bg = p.bg }
hi.MiniFilesCursorLine = { bg = p.bg_menu_sel }
hi.MiniFilesDirectory = { fg = p.accent }
hi.MiniFilesFile = { fg = p.fg_dim }
hi.MiniFilesTitle = { fg = p.accent, bg = p.bg, bold = true }
hi.MiniFilesTitleFocused = { fg = p.accent, bg = p.bg, bold = true }

hi.MiniDiffSignAdd = { fg = p.green, bg = p.bg }
hi.MiniDiffSignChange = { fg = p.yellow, bg = p.bg }
hi.MiniDiffSignDelete = { fg = p.red, bg = p.bg }
hi.MiniDiffOverAdd = { bg = "#1e2a1e" }
hi.MiniDiffOverChange = { bg = "#2a2a1e" }
hi.MiniDiffOverDelete = { bg = "#2a1e1e" }
hi.MiniDiffOverContext = { bg = p.bg_line }

hi.MiniHipatternsFixme = { fg = p.bg, bg = p.red, bold = true }
hi.MiniHipatternsHack = { fg = p.bg, bg = p.yellow, bold = true }
hi.MiniHipatternsTodo = { fg = p.bg, bg = p.blue_bright, bold = true }
hi.MiniHipatternsNote = { fg = p.bg, bg = p.green, bold = true }

---------------------------------------------------------------------------
-- Apply
---------------------------------------------------------------------------

for group, spec in pairs(hi) do
	local ok, err = pcall(vim.api.nvim_set_hl, 0, group, spec)
	if not ok then
		vim.notify(("threepwood: failed to set highlight %s: %s"):format(group, err), vim.log.levels.WARN)
	end
end

-- Remove italics from every resolved highlight group
-- TODO: Better way to do this
local hl_groups = vim.api.nvim_get_hl(0, {})
for key, hl_group in pairs(hl_groups) do
	if hl_group.italic then
		vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
	end
end
