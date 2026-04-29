-- Handmade Hero colorscheme for Neovim
-- Ported from focus-editor: https://github.com/focus-editor/focus
-- Generated automatically. Place in colors/handmade-hero.lua

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.background = "dark"
vim.g.colors_name = "handmade-hero"

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

local c = {
  bg         = "#161616",
  bg_panel   = "#141414",
  bg_popup   = "#121212",
  fg         = "#CDAA7D",
  fg_dim     = "#CDAA7D",
  fg_dim2    = "#7F7F7F",
  comment    = "#7F7F7F",
  gutter     = "#E0AD82",
  border     = "#CDAA7D",
  cursorline = "#121212",
  sel_act    = "#0100CD",
  sel_inact  = "#0100CD",
  search     = "#B55F75",
  bracket    = "#FCEDFC",
  scrollbar  = "#CDAA7D",
  accent     = "#B8860B",
  cursor_col = "#40FF40",
  -- syntax
  string     = "#6B8E23",
  char_lit   = "#6B8E23",
  number     = "#D699B5",
  value      = "#6B8E23",
  keyword    = "#B8860B",
  op         = "#CDAA7D",
  punct      = "#CDAA7D",
  typ        = "#B8860B",
  func       = "#CDAA7D",
  modifier   = "#E67D74",
  attrib     = "#E67D74",
  macro      = "#E0AD82",
  directive  = "#E67D74",
  builtin_v  = "#D699B5",
  builtin_f  = "#E0AD82",
  ident      = "#BFC9DB",
  err        = "#FF0000",
  warn       = "#E4D97D",
  ok         = "#33B333",
  heading1   = "#E67D74",
  heading2   = "#E0AD82",
  heading3   = "#E0AD82",
  heading4   = "#E0AD82",
  heading5   = "#E0AD82",
  heading6   = "#E0AD82",
}

-- ── Editor chrome ──────────────────────────────────────────────────────────
hl("Normal",           { fg = c.fg,        bg = c.bg        })
hl("NormalNC",         { fg = c.fg_dim,    bg = c.bg        })
hl("NormalFloat",      { fg = c.fg,        bg = c.bg_popup  })
hl("FloatBorder",      { fg = c.border,    bg = c.bg_popup  })
hl("FloatTitle",       { fg = c.accent,    bg = c.bg_popup  })
hl("Pmenu",            { fg = c.fg,        bg = c.bg_popup  })
hl("PmenuSel",         { fg = c.fg,        bg = c.sel_act   })
hl("PmenuSbar",        { bg = c.bg_popup  })
hl("PmenuThumb",       { bg = c.scrollbar })
hl("WildMenu",         { fg = c.fg,        bg = c.sel_act   })
hl("StatusLine",       { fg = c.fg_dim,    bg = c.bg_panel  })
hl("StatusLineNC",     { fg = c.fg_dim2,   bg = c.bg_panel  })
hl("TabLine",          { fg = c.fg_dim,    bg = c.bg_panel  })
hl("TabLineSel",       { fg = c.fg,        bg = c.bg        })
hl("TabLineFill",      { bg = c.bg_panel  })
hl("WinBar",           { fg = c.fg_dim,    bg = c.bg        })
hl("WinBarNC",         { fg = c.fg_dim2,   bg = c.bg        })
hl("WinSeparator",     { fg = c.border    })
hl("VertSplit",        { fg = c.border    })
hl("LineNr",           { fg = c.gutter    })
hl("LineNrAbove",      { fg = c.gutter    })
hl("LineNrBelow",      { fg = c.gutter    })
hl("CursorLine",       { bg = c.cursorline })
hl("CursorLineNr",     { fg = c.fg_dim,    bg = c.cursorline })
hl("CursorColumn",     { bg = c.cursorline })
hl("ColorColumn",      { bg = c.cursorline })
hl("SignColumn",       { fg = c.gutter,    bg = c.bg        })
hl("Folded",           { fg = c.fg_dim2,   bg = c.bg_panel  })
hl("FoldColumn",       { fg = c.gutter,    bg = c.bg        })
hl("Conceal",          { fg = c.fg_dim2   })
hl("MatchParen",       { fg = c.bracket,  sp = c.bracket, underline = true })
hl("Visual",           { bg = c.sel_act   })
hl("VisualNOS",        { bg = c.sel_inact })
hl("Search",           { fg = c.bg,        bg = c.search    })
hl("IncSearch",        { fg = c.bg,        bg = c.search    })
hl("CurSearch",        { fg = c.bg,        bg = c.search    })
hl("Substitute",       { fg = c.bg,        bg = c.err       })
hl("NonText",          { fg = c.gutter    })
hl("SpecialKey",       { fg = c.gutter    })
hl("Whitespace",       { fg = c.gutter    })
hl("EndOfBuffer",      { fg = c.gutter    })
hl("Directory",        { fg = c.accent    })
hl("Title",            { fg = c.accent    })
hl("Question",         { fg = c.accent    })
hl("MoreMsg",          { fg = c.ok        })
hl("ModeMsg",          { fg = c.fg        })
hl("MsgArea",          { fg = c.fg_dim    })
hl("MsgSeparator",     { fg = c.border    })
hl("SpellBad",         { sp = c.err,       undercurl = true })
hl("SpellCap",         { sp = c.warn,      undercurl = true })
hl("SpellRare",        { sp = c.fg_dim2,   undercurl = true })
hl("SpellLocal",       { sp = c.fg_dim2,   undercurl = true })
hl("ErrorMsg",         { fg = c.err        })
hl("WarningMsg",       { fg = c.warn       })
hl("DiffAdd",          { fg = c.ok,        bg = c.bg_panel  })
hl("DiffChange",       { fg = c.warn,      bg = c.bg_panel  })
hl("DiffDelete",       { fg = c.err,       bg = c.bg_panel  })
hl("DiffText",         { fg = c.fg,        bg = c.sel_act   })
hl("Added",            { fg = c.ok        })
hl("Changed",          { fg = c.warn      })
hl("Removed",          { fg = c.err       })

-- ── Syntax ────────────────────────────────────────────────────────────────
hl("Comment",          { fg = c.comment   })
hl("String",           { fg = c.string    })
hl("Character",        { fg = c.char_lit  })
hl("Number",           { fg = c.number    })
hl("Float",            { fg = c.number    })
hl("Boolean",          { fg = c.value     })
hl("Constant",         { fg = c.value     })
hl("Identifier",       { fg = c.ident     })
hl("Function",         { fg = c.func      })
hl("Statement",        { fg = c.keyword   })
hl("Conditional",      { fg = c.keyword   })
hl("Repeat",           { fg = c.keyword   })
hl("Label",            { fg = c.keyword   })
hl("Operator",         { fg = c.op        })
hl("Keyword",          { fg = c.keyword   })
hl("Exception",        { fg = c.keyword   })
hl("PreProc",          { fg = c.directive })
hl("Include",          { fg = c.directive })
hl("Define",           { fg = c.directive })
hl("Macro",            { fg = c.macro     })
hl("PreCondit",        { fg = c.directive })
hl("Type",             { fg = c.typ       })
hl("StorageClass",     { fg = c.modifier  })
hl("Structure",        { fg = c.typ       })
hl("Typedef",          { fg = c.typ       })
hl("Special",          { fg = c.char_lit  })
hl("SpecialChar",      { fg = c.char_lit  })
hl("Tag",              { fg = c.typ       })
hl("Delimiter",        { fg = c.punct     })
hl("SpecialComment",   { fg = c.comment   })
hl("Debug",            { fg = c.err       })
hl("Underlined",       { fg = c.string,   underline = true })
hl("Ignore",           { fg = c.gutter    })
hl("Error",            { fg = c.err       })
hl("Todo",             { fg = c.fg,        bg = c.bg_panel  })

-- ── Treesitter ────────────────────────────────────────────────────────────
hl("@comment",                    { fg = c.comment   })
hl("@comment.documentation",      { fg = c.comment   })
hl("@string",                     { fg = c.string    })
hl("@string.escape",              { fg = c.char_lit  })
hl("@string.special",             { fg = c.char_lit  })
hl("@string.regex",               { fg = c.op        })
hl("@character",                  { fg = c.char_lit  })
hl("@number",                     { fg = c.number    })
hl("@number.float",               { fg = c.number    })
hl("@boolean",                    { fg = c.value     })
hl("@constant",                   { fg = c.value     })
hl("@constant.builtin",           { fg = c.value     })
hl("@constant.macro",             { fg = c.macro     })
hl("@variable",                   { fg = c.ident     })
hl("@variable.builtin",           { fg = c.builtin_v })
hl("@variable.parameter",         { fg = c.ident     })
hl("@variable.member",            { fg = c.ident     })
hl("@label",                      { fg = c.keyword   })
hl("@keyword",                    { fg = c.keyword   })
hl("@keyword.import",             { fg = c.keyword   })
hl("@keyword.return",             { fg = c.keyword   })
hl("@keyword.conditional",        { fg = c.keyword   })
hl("@keyword.repeat",             { fg = c.keyword   })
hl("@keyword.exception",          { fg = c.keyword   })
hl("@keyword.directive",          { fg = c.directive })
hl("@keyword.modifier",           { fg = c.modifier  })
hl("@keyword.operator",           { fg = c.op        })
hl("@operator",                   { fg = c.op        })
hl("@punctuation.bracket",        { fg = c.punct     })
hl("@punctuation.delimiter",      { fg = c.punct     })
hl("@punctuation.special",        { fg = c.char_lit  })
hl("@type",                       { fg = c.typ       })
hl("@type.builtin",               { fg = c.typ       })
hl("@type.qualifier",             { fg = c.modifier  })
hl("@type.definition",            { fg = c.typ       })
hl("@attribute",                  { fg = c.attrib    })
hl("@attribute.builtin",          { fg = c.attrib    })
hl("@function",                   { fg = c.func      })
hl("@function.call",              { fg = c.func      })
hl("@function.builtin",           { fg = c.builtin_f })
hl("@function.macro",             { fg = c.macro     })
hl("@function.method",            { fg = c.func      })
hl("@function.method.call",       { fg = c.func      })
hl("@constructor",                { fg = c.typ       })
hl("@module",                     { fg = c.typ       })
hl("@namespace",                  { fg = c.typ       })
hl("@property",                   { fg = c.ident     })
hl("@tag",                        { fg = c.typ       })
hl("@tag.attribute",              { fg = c.attrib    })
hl("@tag.delimiter",              { fg = c.punct     })
hl("@markup.heading",             { fg = c.heading1  })
hl("@markup.heading.1",           { fg = c.heading1  })
hl("@markup.heading.2",           { fg = c.heading2  })
hl("@markup.heading.3",           { fg = c.heading3  })
hl("@markup.heading.4",           { fg = c.heading4  })
hl("@markup.heading.5",           { fg = c.heading5  })
hl("@markup.heading.6",           { fg = c.heading6  })
hl("@markup.bold",                { fg = c.keyword,  bold = true })
hl("@markup.italic",              { fg = c.fg        })
hl("@markup.strikethrough",       { fg = c.comment,  strikethrough = true })
hl("@markup.underline",           { fg = c.fg,       underline = true })
hl("@markup.raw",                 { fg = c.string    })
hl("@markup.raw.block",           { fg = c.string    })
hl("@markup.link",                { fg = c.op,       underline = true })
hl("@markup.link.url",            { fg = c.op,       underline = true })
hl("@markup.link.label",          { fg = c.string    })
hl("@markup.quote",               { fg = c.comment   })
hl("@markup.list",                { fg = c.op        })
hl("@diff.plus",                  { fg = c.ok        })
hl("@diff.minus",                 { fg = c.err       })
hl("@diff.delta",                 { fg = c.warn      })

-- ── LSP diagnostics ───────────────────────────────────────────────────────
hl("DiagnosticError",             { fg = c.err       })
hl("DiagnosticWarn",              { fg = c.warn      })
hl("DiagnosticInfo",              { fg = c.accent    })
hl("DiagnosticHint",              { fg = c.fg_dim    })
hl("DiagnosticOk",                { fg = c.ok        })
hl("DiagnosticUnderlineError",    { sp = c.err,       undercurl = true })
hl("DiagnosticUnderlineWarn",     { sp = c.warn,      undercurl = true })
hl("DiagnosticUnderlineInfo",     { sp = c.accent,    undercurl = true })
hl("DiagnosticUnderlineHint",     { sp = c.fg_dim2,   undercurl = true })
hl("DiagnosticSignError",         { fg = c.err,       bg = c.bg        })
hl("DiagnosticSignWarn",          { fg = c.warn,      bg = c.bg        })
hl("DiagnosticSignInfo",          { fg = c.accent,    bg = c.bg        })
hl("DiagnosticSignHint",          { fg = c.fg_dim,    bg = c.bg        })
hl("DiagnosticVirtualTextError",  { fg = c.err,       bg = c.bg        })
hl("DiagnosticVirtualTextWarn",   { fg = c.warn,      bg = c.bg        })
hl("DiagnosticVirtualTextInfo",   { fg = c.accent,    bg = c.bg        })
hl("DiagnosticVirtualTextHint",   { fg = c.fg_dim,    bg = c.bg        })

-- ── LSP ───────────────────────────────────────────────────────────────────
hl("LspReferenceText",            { bg = c.sel_inact })
hl("LspReferenceRead",            { bg = c.sel_inact })
hl("LspReferenceWrite",           { bg = c.sel_act   })
hl("LspSignatureActiveParameter", { fg = c.accent    })
hl("LspInlayHint",                { fg = c.gutter,    bg = c.bg_panel  })
hl("LspCodeLens",                 { fg = c.gutter    })

-- ── Telescope ─────────────────────────────────────────────────────────────
hl("TelescopeNormal",         { fg = c.fg,        bg = c.bg_popup  })
hl("TelescopeBorder",         { fg = c.border,    bg = c.bg_popup  })
hl("TelescopePromptNormal",   { fg = c.fg,        bg = c.bg_panel  })
hl("TelescopePromptBorder",   { fg = c.border,    bg = c.bg_panel  })
hl("TelescopePromptTitle",    { fg = c.accent,    bg = c.bg_panel  })
hl("TelescopeResultsTitle",   { fg = c.fg_dim,    bg = c.bg_popup  })
hl("TelescopePreviewTitle",   { fg = c.fg_dim,    bg = c.bg_popup  })
hl("TelescopeSelection",      { fg = c.fg,        bg = c.sel_act   })
hl("TelescopeMatching",       { fg = c.accent     })

-- ── nvim-cmp ──────────────────────────────────────────────────────────────
hl("CmpNormal",               { bg = c.bg_popup  })
hl("CmpItemAbbr",             { fg = c.fg        })
hl("CmpItemAbbrMatch",        { fg = c.accent    })
hl("CmpItemAbbrMatchFuzzy",   { fg = c.accent    })
hl("CmpItemAbbrDeprecated",   { fg = c.gutter,   strikethrough = true })
hl("CmpItemKindText",         { fg = c.fg_dim    })
hl("CmpItemKindMethod",       { fg = c.func      })
hl("CmpItemKindFunction",     { fg = c.func      })
hl("CmpItemKindConstructor",  { fg = c.typ       })
hl("CmpItemKindField",        { fg = c.ident     })
hl("CmpItemKindVariable",     { fg = c.ident     })
hl("CmpItemKindClass",        { fg = c.typ       })
hl("CmpItemKindInterface",    { fg = c.typ       })
hl("CmpItemKindModule",       { fg = c.typ       })
hl("CmpItemKindProperty",     { fg = c.ident     })
hl("CmpItemKindUnit",         { fg = c.number    })
hl("CmpItemKindValue",        { fg = c.value     })
hl("CmpItemKindEnum",         { fg = c.typ       })
hl("CmpItemKindKeyword",      { fg = c.keyword   })
hl("CmpItemKindSnippet",      { fg = c.string    })
hl("CmpItemKindColor",        { fg = c.attrib    })
hl("CmpItemKindFile",         { fg = c.fg_dim    })
hl("CmpItemKindEnumMember",   { fg = c.typ       })
hl("CmpItemKindConstant",     { fg = c.value     })
hl("CmpItemKindStruct",       { fg = c.typ       })
hl("CmpItemKindEvent",        { fg = c.attrib    })
hl("CmpItemKindOperator",     { fg = c.op        })
hl("CmpItemKindTypeParameter",{ fg = c.typ       })
hl("CmpItemMenu",             { fg = c.gutter    })

-- ── Gitsigns / Neogit ─────────────────────────────────────────────────────
hl("GitSignsAdd",             { fg = c.ok,       bg = c.bg        })
hl("GitSignsChange",          { fg = c.warn,     bg = c.bg        })
hl("GitSignsDelete",          { fg = c.err,      bg = c.bg        })

-- ── Terminal colors ───────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.bg_panel
vim.g.terminal_color_1  = c.err
vim.g.terminal_color_2  = c.ok
vim.g.terminal_color_3  = c.warn
vim.g.terminal_color_4  = c.keyword
vim.g.terminal_color_5  = c.typ
vim.g.terminal_color_6  = c.string
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.gutter
vim.g.terminal_color_9  = c.err
vim.g.terminal_color_10 = c.ok
vim.g.terminal_color_11 = c.warn
vim.g.terminal_color_12 = c.accent
vim.g.terminal_color_13 = c.attrib
vim.g.terminal_color_14 = c.func
vim.g.terminal_color_15 = c.fg
