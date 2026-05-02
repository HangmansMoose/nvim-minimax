-- casey.lua

-- Neovim colorscheme based on Casey Muratori's 4coder theme
-- Drop into: ~/.config/nvim/colors/casey.lua
-- Then run:  :colorscheme casey

vim.cmd("highlight clear")

vim.g.colors_name = "casey"
vim.o.termguicolors = true
vim.o.background = "dark"

-- ---------------------------------------------------------------------------
-- Palette
-- ---------------------------------------------------------------------------
local c = {
  bg          = "#0c0c0c",
  bg_gutter   = "#101010",
  bg_line     = "#1f1f27",
  bg_sel      = "#315268",
  bg_popup    = "#141414",
  bg_float    = "#141414",

  fg          = "#a08563",   -- default text (warm tan)
  fg_muted    = "#686868",   -- comments / muted
  fg_dim      = "#5b4d3c",   -- disabled / placeholder

  keyword     = "#ac7b0b",   -- amber  – keywords, storage
  func        = "#cc5735",   -- burnt orange – functions
  type        = "#d8a51d",   -- gold – types, properties
  macro       = "#478980",   -- teal – preprocessor / macros
  string      = "#6b8e23",   -- olive green – strings, numbers, constants
  operator    = "#907553",   -- warm brown – operators, punctuation
  attr        = "#b09573",   -- light tan – attributes, active guides
  comment     = "#686868",   -- gray

  cursor_p    = "#00ee00",   -- primary cursor (green)
  cursor_s    = "#ee7700",   -- secondary cursor (orange)

  error       = "#ff0000",
  warn        = "#e3811c",
  info        = "#d8a51d",
  hint        = "#686868",

  diff_add    = "#6b8e23",
  diff_del    = "#3a0000",
  diff_change = "#ac7b0b",
  diff_text   = "#d8a51d",

  indent      = "#9ba29030",
  border      = "#2d3640",
}

-- ---------------------------------------------------------------------------
-- Helper
-- ---------------------------------------------------------------------------
local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ---------------------------------------------------------------------------
-- Editor chrome
-- ---------------------------------------------------------------------------
hl("Normal",          { fg = c.fg,       bg = c.bg })
hl("NormalFloat",     { fg = c.fg,       bg = c.bg_float })
hl("NormalNC",        { fg = c.fg,       bg = c.bg })
hl("SignColumn",      { fg = c.fg_muted, bg = c.bg_gutter })
hl("LineNr",          { fg = c.fg_muted, bg = c.bg_gutter })
hl("CursorLineNr",    { fg = c.fg,       bg = c.bg_gutter, bold = true })
hl("CursorLine",      { bg = c.bg_line })
hl("CursorColumn",    { bg = c.bg_line })
hl("ColorColumn",     { bg = c.bg_line })
hl("Cursor",          { fg = c.bg,       bg = c.cursor_p })
hl("lCursor",         { fg = c.bg,       bg = c.cursor_p })
hl("CursorIM",        { fg = c.bg,       bg = c.cursor_p })
hl("TermCursor",      { fg = c.bg,       bg = c.cursor_p })
hl("TermCursorNC",    { fg = c.bg,       bg = c.cursor_s })

hl("Visual",          { bg = c.bg_sel })
hl("VisualNOS",       { bg = c.bg_sel })
hl("Selection",       { bg = c.bg_sel })

hl("StatusLine",      { fg = c.attr,     bg = c.bg_line })
hl("StatusLineNC",    { fg = c.fg_muted, bg = c.bg_gutter })
hl("WinBar",          { fg = c.fg,       bg = c.bg })
hl("WinBarNC",        { fg = c.fg_muted, bg = c.bg })
hl("TabLine",         { fg = c.fg_muted, bg = c.bg_gutter })
hl("TabLineSel",      { fg = c.fg,       bg = c.bg_line, bold = true })
hl("TabLineFill",     { bg = c.bg })

hl("Pmenu",           { fg = c.fg,       bg = c.bg_popup })
hl("PmenuSel",        { fg = c.fg,       bg = c.bg_sel })
hl("PmenuSbar",       { bg = c.bg_line })
hl("PmenuThumb",      { bg = c.attr })
hl("PmenuKind",       { fg = c.type,     bg = c.bg_popup })
hl("PmenuKindSel",    { fg = c.type,     bg = c.bg_sel })
hl("PmenuExtra",      { fg = c.fg_muted, bg = c.bg_popup })
hl("PmenuExtraSel",   { fg = c.fg_muted, bg = c.bg_sel })

hl("WildMenu",        { fg = c.bg,       bg = c.type })
hl("VertSplit",       { fg = c.border,   bg = c.bg })
hl("WinSeparator",    { fg = c.border,   bg = c.bg })
hl("FloatBorder",     { fg = c.border,   bg = c.bg_float })
hl("FloatTitle",      { fg = c.attr,     bg = c.bg_float, bold = true })

hl("Folded",          { fg = c.fg_muted, bg = c.bg_line })
hl("FoldColumn",      { fg = c.fg_muted, bg = c.bg_gutter })

hl("Search",          { fg = c.bg,       bg = c.type })
hl("IncSearch",       { fg = c.bg,       bg = c.cursor_p })
hl("CurSearch",       { fg = c.bg,       bg = c.cursor_p })
hl("Substitute",      { fg = c.bg,       bg = c.cursor_s })

hl("MatchParen",      { fg = c.cursor_p, bg = c.bg_sel, bold = true })

hl("NonText",         { fg = c.border })
hl("Whitespace",      { fg = c.border })
hl("SpecialKey",      { fg = c.border })
hl("EndOfBuffer",     { fg = c.bg_gutter })

hl("QuickFixLine",    { bg = c.bg_sel })
hl("qfLineNr",        { fg = c.type })
hl("qfFileName",      { fg = c.macro })

hl("Directory",       { fg = c.macro })
hl("Title",           { fg = c.type,     bold = true })
hl("Question",        { fg = c.cursor_p })
hl("MoreMsg",         { fg = c.cursor_p })
hl("ModeMsg",         { fg = c.fg,       bold = true })
hl("MsgArea",         { fg = c.fg })
hl("MsgSeparator",    { fg = c.border })
hl("ErrorMsg",        { fg = c.error,    bold = true })
hl("WarningMsg",      { fg = c.warn })

hl("SpellBad",        { sp = c.error,    undercurl = true })
hl("SpellCap",        { sp = c.warn,     undercurl = true })
hl("SpellLocal",      { sp = c.info,     undercurl = true })
hl("SpellRare",       { sp = c.hint,     undercurl = true })

hl("IndentBlanklineChar",        { fg = c.border })
hl("IndentBlanklineContextChar", { fg = c.attr })

-- ---------------------------------------------------------------------------
-- Syntax (classic vim groups)
-- ---------------------------------------------------------------------------
hl("Comment",        { fg = c.comment, italic = false })
hl("Constant",       { fg = c.string })
hl("String",         { fg = c.string })
hl("Character",      { fg = c.string })
hl("Number",         { fg = c.string })
hl("Float",          { fg = c.string })
hl("Boolean",        { fg = c.string })

hl("Identifier",     { fg = c.fg })
hl("Function",       { fg = c.func })

hl("Statement",      { fg = c.keyword })
hl("Conditional",    { fg = c.keyword })
hl("Repeat",         { fg = c.keyword })
hl("Label",          { fg = c.keyword })
hl("Operator",       { fg = c.operator })
hl("Keyword",        { fg = c.keyword })
hl("Exception",      { fg = c.keyword })

hl("PreProc",        { fg = c.macro })
hl("Include",        { fg = c.macro })
hl("Define",         { fg = c.macro })
hl("Macro",          { fg = c.macro })
hl("PreCondit",      { fg = c.macro })

hl("Type",           { fg = c.type })
hl("StorageClass",   { fg = c.keyword })
hl("Structure",      { fg = c.type })
hl("Typedef",        { fg = c.type })

hl("Special",        { fg = c.attr })
hl("SpecialChar",    { fg = c.string })
hl("Tag",            { fg = c.keyword })
hl("Delimiter",      { fg = c.operator })
hl("SpecialComment", { fg = c.comment, italic = true })
hl("Debug",          { fg = c.warn })

hl("Underlined",     { underline = true })
hl("Ignore",         { fg = c.fg_dim })
hl("Error",          { fg = c.error, bold = true })
hl("Todo",           { fg = c.bg, bg = c.type, bold = true })

-- ---------------------------------------------------------------------------
-- Treesitter (@-prefixed groups, nvim 0.8+)
-- ---------------------------------------------------------------------------
-- Variables
hl("@variable",              { fg = c.fg })
hl("@variable.builtin",      { fg = c.keyword })
hl("@variable.parameter",    { fg = c.fg })
hl("@variable.member",       { fg = c.type })

-- Constants
hl("@constant",              { fg = c.string })
hl("@constant.builtin",      { fg = c.string })
hl("@constant.macro",        { fg = c.macro })

-- Strings
hl("@string",                { fg = c.string })
hl("@string.escape",         { fg = c.string })
hl("@string.special",        { fg = c.string })
hl("@string.regex",          { fg = c.string })
hl("@character",             { fg = c.string })
hl("@character.special",     { fg = c.string })
hl("@number",                { fg = c.string })
hl("@float",                 { fg = c.string })
hl("@boolean",               { fg = c.string })

-- Functions
hl("@function",              { fg = c.func })
hl("@function.builtin",      { fg = c.func })
hl("@function.call",         { fg = c.func })
hl("@function.macro",        { fg = c.macro })
hl("@function.method",       { fg = c.func })
hl("@function.method.call",  { fg = c.func })
hl("@constructor",           { fg = c.type })

-- Keywords
hl("@keyword",               { fg = c.keyword })
hl("@keyword.function",      { fg = c.keyword })
hl("@keyword.operator",      { fg = c.operator })
hl("@keyword.return",        { fg = c.keyword })
hl("@keyword.import",        { fg = c.macro })
hl("@keyword.conditional",   { fg = c.keyword })
hl("@keyword.repeat",        { fg = c.keyword })
hl("@keyword.exception",     { fg = c.keyword })
hl("@keyword.storage",       { fg = c.keyword })
hl("@keyword.coroutine",     { fg = c.keyword })
hl("@keyword.directive",     { fg = c.macro })
hl("@keyword.directive.define", { fg = c.macro })

-- Types
hl("@type",                  { fg = c.type })
hl("@type.builtin",          { fg = c.keyword })
hl("@type.qualifier",        { fg = c.keyword })
hl("@type.definition",       { fg = c.type })

-- Operators & punctuation
hl("@operator",              { fg = c.operator })
hl("@punctuation",           { fg = c.operator })
hl("@punctuation.bracket",   { fg = c.operator })
hl("@punctuation.delimiter", { fg = c.operator })
hl("@punctuation.special",   { fg = c.macro })

-- Properties / attributes
hl("@property",              { fg = c.type })
hl("@attribute",             { fg = c.attr })

-- Comments
hl("@comment",               { fg = c.comment })
hl("@comment.documentation", { fg = c.comment })
hl("@comment.error",         { fg = c.error })
hl("@comment.warning",       { fg = c.warn })
hl("@comment.note",          { fg = c.info })
hl("@comment.todo",          { fg = c.bg, bg = c.type, bold = true })

-- Markup (markdown etc.)
hl("@markup.heading",        { fg = c.type, bold = true })
hl("@markup.link",           { fg = c.macro, underline = true })
hl("@markup.link.url",       { fg = c.string, underline = true })
hl("@markup.raw",            { fg = c.func })
hl("@markup.quote",          { fg = c.comment, italic = true })
hl("@markup.list",           { fg = c.keyword })
hl("@markup.italic",         { italic = true })
hl("@markup.strong",         { bold = true })
hl("@markup.strikethrough",  { strikethrough = true })

-- Tags (HTML/JSX)
hl("@tag",                   { fg = c.keyword })
hl("@tag.attribute",         { fg = c.attr })
hl("@tag.delimiter",         { fg = c.operator })

-- Misc
hl("@label",                 { fg = c.type })
hl("@namespace",             { fg = c.macro })
hl("@module",                { fg = c.macro })
hl("@embedded",              { fg = c.error })

-- ---------------------------------------------------------------------------
-- LSP semantic tokens
-- ---------------------------------------------------------------------------
hl("@lsp.type.function",     { link = "@function" })
hl("@lsp.type.method",       { link = "@function.method" })
hl("@lsp.type.keyword",      { link = "@keyword" })
hl("@lsp.type.namespace",    { link = "@namespace" })
hl("@lsp.type.type",         { link = "@type" })
hl("@lsp.type.class",        { link = "@type" })
hl("@lsp.type.struct",       { link = "@type" })
hl("@lsp.type.interface",    { link = "@type" })
hl("@lsp.type.enum",         { link = "@type" })
hl("@lsp.type.enumMember",   { link = "@constant" })
hl("@lsp.type.typeParameter",{ link = "@type" })
hl("@lsp.type.parameter",    { link = "@variable.parameter" })
hl("@lsp.type.variable",     { link = "@variable" })
hl("@lsp.type.property",     { link = "@property" })
hl("@lsp.type.macro",        { link = "@function.macro" })
hl("@lsp.type.decorator",    { link = "@attribute" })
hl("@lsp.type.comment",      { link = "@comment" })
hl("@lsp.type.string",       { link = "@string" })
hl("@lsp.type.number",       { link = "@number" })
hl("@lsp.type.operator",     { link = "@operator" })
hl("@lsp.mod.deprecated",    { strikethrough = true })
hl("@lsp.mod.readonly",      { fg = c.string })

-- ---------------------------------------------------------------------------
-- LSP diagnostic highlights
-- ---------------------------------------------------------------------------
hl("DiagnosticError",            { fg = c.error })
hl("DiagnosticWarn",             { fg = c.warn })
hl("DiagnosticInfo",             { fg = c.info })
hl("DiagnosticHint",             { fg = c.hint })
hl("DiagnosticOk",               { fg = c.diff_add })
hl("DiagnosticUnderlineError",   { sp = c.error, undercurl = true })
hl("DiagnosticUnderlineWarn",    { sp = c.warn,  undercurl = true })
hl("DiagnosticUnderlineInfo",    { sp = c.info,  undercurl = true })
hl("DiagnosticUnderlineHint",    { sp = c.hint,  undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.error, bg = "#1a0000" })
hl("DiagnosticVirtualTextWarn",  { fg = c.warn,  bg = "#1a0e00" })
hl("DiagnosticVirtualTextInfo",  { fg = c.info,  bg = "#1a1500" })
hl("DiagnosticVirtualTextHint",  { fg = c.hint,  bg = c.bg_line })
hl("DiagnosticSignError",        { fg = c.error })
hl("DiagnosticSignWarn",         { fg = c.warn })
hl("DiagnosticSignInfo",         { fg = c.info })
hl("DiagnosticSignHint",         { fg = c.hint })
hl("DiagnosticFloatingError",    { fg = c.error })
hl("DiagnosticFloatingWarn",     { fg = c.warn })
hl("DiagnosticFloatingInfo",     { fg = c.info })
hl("DiagnosticFloatingHint",     { fg = c.hint })

-- ---------------------------------------------------------------------------
-- Diff
-- ---------------------------------------------------------------------------
hl("DiffAdd",    { fg = c.diff_add,    bg = "#0d1a00" })
hl("DiffDelete", { fg = c.error,       bg = c.diff_del })
hl("DiffChange", { fg = c.diff_change, bg = "#1a1000" })
hl("DiffText",   { fg = c.diff_text,   bg = "#1a1800", bold = true })

hl("diffAdded",   { link = "DiffAdd" })
hl("diffRemoved", { link = "DiffDelete" })
hl("diffChanged", { link = "DiffChange" })
hl("diffOldFile", { fg = c.error })
hl("diffNewFile", { fg = c.diff_add })
hl("diffFile",    { fg = c.macro })
hl("diffLine",    { fg = c.comment })
hl("diffIndexLine", { fg = c.attr })

-- ---------------------------------------------------------------------------
-- Git signs (gitsigns.nvim)
-- ---------------------------------------------------------------------------
hl("GitSignsAdd",             { fg = c.diff_add,    bg = c.bg_gutter })
hl("GitSignsChange",          { fg = c.diff_change, bg = c.bg_gutter })
hl("GitSignsDelete",          { fg = c.error,       bg = c.bg_gutter })
hl("GitSignsAddInline",       { bg = "#0d1a00" })
hl("GitSignsChangeInline",    { bg = "#1a1000" })
hl("GitSignsDeleteInline",    { bg = c.diff_del })

-- ---------------------------------------------------------------------------
-- nvim-tree / neo-tree
-- ---------------------------------------------------------------------------
hl("NvimTreeNormal",          { fg = c.fg,       bg = c.bg_gutter })
hl("NvimTreeNormalNC",        { fg = c.fg,       bg = c.bg_gutter })
hl("NvimTreeRootFolder",      { fg = c.macro,    bold = true })
hl("NvimTreeFolderIcon",      { fg = c.macro })
hl("NvimTreeFolderName",      { fg = c.fg })
hl("NvimTreeOpenedFolderName",{ fg = c.attr,     bold = true })
hl("NvimTreeEmptyFolderName", { fg = c.fg_muted })
hl("NvimTreeFileName",        { fg = c.fg })
hl("NvimTreeSpecialFile",     { fg = c.type,     underline = true })
hl("NvimTreeImageFile",       { fg = c.func })
hl("NvimTreeExecFile",        { fg = c.cursor_p, bold = true })
hl("NvimTreeGitDirty",        { fg = c.diff_change })
hl("NvimTreeGitStaged",       { fg = c.diff_add })
hl("NvimTreeGitNew",          { fg = c.diff_add })
hl("NvimTreeGitDeleted",      { fg = c.error })
hl("NvimTreeIndentMarker",    { fg = c.border })
hl("NvimTreeWinSeparator",    { fg = c.border })

-- ---------------------------------------------------------------------------
-- Telescope
-- ---------------------------------------------------------------------------
hl("TelescopeNormal",         { fg = c.fg,       bg = c.bg_float })
hl("TelescopeBorder",         { fg = c.border,   bg = c.bg_float })
hl("TelescopeTitle",          { fg = c.attr,     bold = true })
hl("TelescopePromptNormal",   { fg = c.fg,       bg = c.bg_line })
hl("TelescopePromptBorder",   { fg = c.attr,     bg = c.bg_line })
hl("TelescopePromptTitle",    { fg = c.bg,       bg = c.func, bold = true })
hl("TelescopePreviewTitle",   { fg = c.bg,       bg = c.macro, bold = true })
hl("TelescopeResultsTitle",   { fg = c.bg,       bg = c.border })
hl("TelescopeSelection",      { fg = c.fg,       bg = c.bg_sel })
hl("TelescopeSelectionCaret", { fg = c.cursor_p, bg = c.bg_sel })
hl("TelescopeMatching",       { fg = c.type,     bold = true })
hl("TelescopePromptPrefix",   { fg = c.cursor_p })

-- ---------------------------------------------------------------------------
-- Which-key
-- ---------------------------------------------------------------------------
hl("WhichKey",          { fg = c.type })
hl("WhichKeyGroup",     { fg = c.macro })
hl("WhichKeyDesc",      { fg = c.fg })
hl("WhichKeySeparator", { fg = c.fg_muted })
hl("WhichKeyFloat",     { bg = c.bg_float })
hl("WhichKeyBorder",    { fg = c.border })

-- ---------------------------------------------------------------------------
-- indent-blankline (v3)
-- ---------------------------------------------------------------------------
hl("IblIndent",         { fg = c.border })
hl("IblScope",          { fg = c.attr })

-- ---------------------------------------------------------------------------
-- nvim-cmp
-- ---------------------------------------------------------------------------
hl("CmpItemAbbr",           { fg = c.fg })
hl("CmpItemAbbrDeprecated", { fg = c.fg_dim, strikethrough = true })
hl("CmpItemAbbrMatch",      { fg = c.type, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.type })
hl("CmpItemKind",           { fg = c.attr })
hl("CmpItemMenu",           { fg = c.fg_muted })
hl("CmpItemKindFunction",   { fg = c.func })
hl("CmpItemKindMethod",     { fg = c.func })
hl("CmpItemKindConstructor",{ fg = c.type })
hl("CmpItemKindClass",      { fg = c.type })
hl("CmpItemKindStruct",     { fg = c.type })
hl("CmpItemKindInterface",  { fg = c.type })
hl("CmpItemKindEnum",       { fg = c.type })
hl("CmpItemKindEnumMember", { fg = c.string })
hl("CmpItemKindKeyword",    { fg = c.keyword })
hl("CmpItemKindVariable",   { fg = c.fg })
hl("CmpItemKindConstant",   { fg = c.string })
hl("CmpItemKindField",      { fg = c.type })
hl("CmpItemKindProperty",   { fg = c.type })
hl("CmpItemKindModule",     { fg = c.macro })
hl("CmpItemKindSnippet",    { fg = c.attr })
hl("CmpItemKindText",       { fg = c.fg_muted })
hl("CmpItemKindOperator",   { fg = c.operator })
hl("CmpItemKindTypeParameter", { fg = c.type })

-- ---------------------------------------------------------------------------
-- Lualine (optional – set in your lualine config, but these link groups help)
-- ---------------------------------------------------------------------------
hl("LualineNormalA",  { fg = c.bg,  bg = c.cursor_p, bold = true })
hl("LualineNormalB",  { fg = c.fg,  bg = c.bg_line })
hl("LualineNormalC",  { fg = c.fg_muted, bg = c.bg_gutter })
hl("LualineInsertA",  { fg = c.bg,  bg = c.func, bold = true })
hl("LualineVisualA",  { fg = c.bg,  bg = c.type, bold = true })
hl("LualineReplaceA", { fg = c.bg,  bg = c.cursor_s, bold = true })
hl("LualineCommandA", { fg = c.bg,  bg = c.macro, bold = true })

-- ---------------------------------------------------------------------------
-- Neovim built-in LSP
-- ---------------------------------------------------------------------------
hl("LspReferenceText",  { bg = "#2f2f37" })
hl("LspReferenceRead",  { bg = "#2f2f37" })
hl("LspReferenceWrite", { bg = "#315268" })
hl("LspInlayHint",      { fg = c.fg_dim, bg = c.bg_line, italic = true })
hl("LspCodeLens",       { fg = c.fg_dim, italic = true })
hl("LspSignatureActiveParameter", { fg = c.cursor_p, bold = true })

-- ---------------------------------------------------------------------------
-- Notify / noice
-- ---------------------------------------------------------------------------
hl("NotifyERRORBorder", { fg = c.error })
hl("NotifyWARNBorder",  { fg = c.warn })
hl("NotifyINFOBorder",  { fg = c.info })
hl("NotifyDEBUGBorder", { fg = c.fg_muted })
hl("NotifyTRACEBorder", { fg = c.fg_muted })
hl("NotifyERRORIcon",   { fg = c.error })
hl("NotifyWARNIcon",    { fg = c.warn })
hl("NotifyINFOIcon",    { fg = c.info })
hl("NotifyERRORTitle",  { fg = c.error, bold = true })
hl("NotifyWARNTitle",   { fg = c.warn,  bold = true })
hl("NotifyINFOTitle",   { fg = c.info,  bold = true })
hl("NotifyERRORBody",   { link = "Normal" })
hl("NotifyWARNBody",    { link = "Normal" })
hl("NotifyINFOBody",    { link = "Normal" })
