-- Vercel Dark for Neovim
-- Palette kept in sync with:
--   ~/.config/ghostty/themes/vercel-dark
--   ~/.config/helix/themes/vercel-dark.toml

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "vercel-dark"

local c = {
  bg = "#101010",
  fg = "#ededed",
  bg_highlight = "#1a1a1a",
  bg_float = "#1a1a1a",
  black = "#000000",
  white = "#ededed",
  gray = "#a1a1a1",
  bright_black = "#676767",
  red = "#f32e40",
  magenta = "#f12b82", -- errors and destructive states
  purple = "#8b5cf6", -- secondary accent and keywords
  green = "#00ac3a",
  yellow = "#ffae00",
  amber = "#f59e0b",
  blue = "#52a8ff",
  cyan = "#00aa95",
  selection = "#264564",
  none = "NONE",
}

-- Terminal colours mirror the ghostty palette exactly.
local terminal = {
  c.black,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.magenta,
  c.cyan,
  c.gray,
  c.bright_black,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.magenta,
  c.cyan,
  c.white,
}
for i, color in ipairs(terminal) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

local hl = {
  ---------------------------------------------------------------------------
  -- Editor UI
  ---------------------------------------------------------------------------
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.bg_float },
  FloatBorder = { fg = c.bright_black, bg = c.bg_float },
  FloatTitle = { fg = c.purple, bg = c.bg_float, bold = true },

  Cursor = { fg = c.bg, bg = c.purple },
  lCursor = { fg = c.bg, bg = c.purple },
  CursorIM = { fg = c.bg, bg = c.purple },
  TermCursor = { fg = c.bg, bg = c.purple },
  CursorLine = { bg = c.bg_highlight },
  CursorColumn = { bg = c.bg_highlight },
  ColorColumn = { bg = c.bg_highlight },

  LineNr = { fg = c.gray },
  LineNrAbove = { fg = c.bright_black },
  LineNrBelow = { fg = c.bright_black },
  CursorLineNr = { fg = c.white, bold = true },
  CursorLineSign = { bg = c.bg },
  SignColumn = { fg = c.bright_black, bg = c.bg },
  FoldColumn = { fg = c.bright_black, bg = c.bg },
  Folded = { fg = c.gray, bg = c.bg_highlight },

  Visual = { bg = c.selection },
  VisualNOS = { bg = c.selection },
  Search = { fg = c.bg, bg = c.yellow },
  IncSearch = { fg = c.bg, bg = c.purple },
  CurSearch = { fg = c.bg, bg = c.purple },
  Substitute = { fg = c.bg, bg = c.red },
  MatchParen = { fg = c.yellow, underline = true, bold = true },

  StatusLine = { fg = c.fg, bg = c.bg_highlight },
  StatusLineNC = { fg = c.gray, bg = c.bg_highlight },
  WinBar = { fg = c.gray, bg = c.bg },
  WinBarNC = { fg = c.bright_black, bg = c.bg },
  WinSeparator = { fg = c.bright_black, bg = c.bg },
  VertSplit = { fg = c.bright_black, bg = c.bg },

  TabLine = { fg = c.gray, bg = c.bg_highlight },
  TabLineFill = { bg = c.bg_highlight },
  TabLineSel = { fg = c.fg, bg = c.bg },

  Pmenu = { fg = c.fg, bg = c.bg_float },
  PmenuSel = { fg = c.bg, bg = c.purple },
  PmenuKind = { fg = c.cyan, bg = c.bg_float },
  PmenuKindSel = { fg = c.bg, bg = c.purple },
  PmenuExtra = { fg = c.gray, bg = c.bg_float },
  PmenuExtraSel = { fg = c.bg, bg = c.purple },
  PmenuSbar = { bg = c.bg_highlight },
  PmenuThumb = { bg = c.bright_black },

  WildMenu = { fg = c.bg, bg = c.purple },
  QuickFixLine = { bg = c.bg_highlight, bold = true },
  Directory = { fg = c.purple },
  Title = { fg = c.purple, bold = true },
  Conceal = { fg = c.bright_black },
  NonText = { fg = c.bright_black },
  Whitespace = { fg = c.bright_black },
  SpecialKey = { fg = c.bright_black },
  EndOfBuffer = { fg = c.bg },
  Question = { fg = c.green },
  MoreMsg = { fg = c.green },
  ModeMsg = { fg = c.fg, bold = true },
  MsgArea = { fg = c.fg },
  MsgSeparator = { fg = c.bright_black, bg = c.bg_highlight },
  ErrorMsg = { fg = c.magenta },
  WarningMsg = { fg = c.yellow },

  SpellBad = { sp = c.red, undercurl = true },
  SpellCap = { sp = c.yellow, undercurl = true },
  SpellLocal = { sp = c.blue, undercurl = true },
  SpellRare = { sp = c.cyan, undercurl = true },

  ---------------------------------------------------------------------------
  -- Legacy syntax groups (mirrors the Helix "Syntax" section)
  ---------------------------------------------------------------------------
  Comment = { fg = c.gray, italic = true },
  Constant = { fg = c.amber },
  String = { fg = c.green },
  Character = { fg = c.green },
  Number = { fg = c.amber },
  Boolean = { fg = c.amber },
  Float = { fg = c.amber },

  Identifier = { fg = c.fg },
  Function = { fg = c.blue },

  Statement = { fg = c.purple },
  Conditional = { fg = c.purple },
  Repeat = { fg = c.purple },
  Label = { fg = c.purple },
  Operator = { fg = c.white },
  Keyword = { fg = c.purple },
  Exception = { fg = c.purple },

  PreProc = { fg = c.purple },
  Include = { fg = c.purple },
  Define = { fg = c.purple },
  Macro = { fg = c.cyan },
  PreCondit = { fg = c.magenta },

  Type = { fg = c.white },
  StorageClass = { fg = c.white },
  Structure = { fg = c.white },
  Typedef = { fg = c.white },

  Special = { fg = c.blue },
  SpecialChar = { fg = c.cyan },
  Tag = { fg = c.red },
  Delimiter = { fg = c.fg },
  SpecialComment = { fg = c.gray, italic = true },
  Debug = { fg = c.red },

  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },
  Ignore = { fg = c.bright_black },
  Error = { fg = c.magenta },
  Todo = { fg = c.bg, bg = c.yellow, bold = true },

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  ["@comment"] = { link = "Comment" },
  ["@comment.error"] = { fg = c.red },
  ["@comment.warning"] = { fg = c.yellow },
  ["@comment.note"] = { fg = c.cyan },
  ["@comment.todo"] = { link = "Todo" },

  ["@variable"] = { fg = c.fg },
  ["@variable.builtin"] = { fg = c.amber },
  ["@variable.parameter"] = { fg = c.fg },
  ["@variable.member"] = { fg = c.cyan },

  ["@constant"] = { fg = c.amber },
  ["@constant.builtin"] = { fg = c.amber },
  ["@constant.macro"] = { fg = c.cyan },

  ["@module"] = { fg = c.white },
  ["@module.builtin"] = { fg = c.white },
  ["@label"] = { fg = c.magenta },

  ["@string"] = { fg = c.green },
  ["@string.documentation"] = { fg = c.green },
  ["@string.regexp"] = { fg = c.green },
  ["@string.escape"] = { fg = c.green },
  ["@string.special"] = { fg = c.white },
  ["@string.special.path"] = { fg = c.white },
  ["@string.special.symbol"] = { fg = c.white },
  ["@string.special.url"] = { fg = c.white, underline = true },
  ["@character"] = { fg = c.green },
  ["@character.special"] = { fg = c.cyan },

  ["@boolean"] = { fg = c.amber },
  ["@number"] = { fg = c.amber },
  ["@number.float"] = { fg = c.amber },

  ["@type"] = { fg = c.white },
  ["@type.builtin"] = { fg = c.white },
  ["@type.definition"] = { fg = c.white },
  ["@attribute"] = { fg = c.cyan },
  ["@attribute.builtin"] = { fg = c.cyan },
  ["@property"] = { fg = c.white },

  ["@function"] = { fg = c.blue },
  ["@function.builtin"] = { fg = c.white },
  ["@function.call"] = { fg = c.white },
  ["@function.macro"] = { fg = c.blue },
  ["@function.method"] = { fg = c.blue },
  ["@function.method.call"] = { fg = c.white },
  ["@constructor"] = { fg = c.blue },

  ["@operator"] = { fg = c.white },
  ["@keyword"] = { fg = c.purple },
  ["@keyword.coroutine"] = { fg = c.purple },
  ["@keyword.function"] = { fg = c.purple },
  ["@keyword.operator"] = { fg = c.white },
  ["@keyword.import"] = { fg = c.purple },
  ["@keyword.type"] = { fg = c.purple },
  ["@keyword.modifier"] = { fg = c.purple },
  ["@keyword.repeat"] = { fg = c.purple },
  ["@keyword.return"] = { fg = c.purple },
  ["@keyword.debug"] = { fg = c.purple },
  ["@keyword.exception"] = { fg = c.purple },
  ["@keyword.conditional"] = { fg = c.purple },
  ["@keyword.conditional.ternary"] = { fg = c.cyan },
  ["@keyword.directive"] = { fg = c.purple },
  ["@keyword.directive.define"] = { fg = c.purple },

  ["@punctuation.delimiter"] = { fg = c.fg },
  ["@punctuation.bracket"] = { fg = c.fg },
  ["@punctuation.special"] = { fg = c.blue },

  ["@tag"] = { fg = c.red },
  ["@tag.builtin"] = { fg = c.red },
  ["@tag.attribute"] = { fg = c.cyan },
  ["@tag.delimiter"] = { fg = c.fg },

  -- Markup (mirrors the Helix "Markup" section)
  ["@markup"] = { fg = c.fg },
  ["@markup.heading"] = { fg = c.blue, bold = true },
  ["@markup.heading.1"] = { fg = c.blue, bold = true },
  ["@markup.heading.2"] = { fg = c.blue, bold = true },
  ["@markup.heading.3"] = { fg = c.blue, bold = true },
  ["@markup.heading.4"] = { fg = c.blue, bold = true },
  ["@markup.heading.5"] = { fg = c.blue, bold = true },
  ["@markup.heading.6"] = { fg = c.blue, bold = true },
  ["@markup.strong"] = { fg = c.yellow, bold = true },
  ["@markup.italic"] = { fg = c.magenta, italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.quote"] = { fg = c.gray },
  ["@markup.math"] = { fg = c.cyan },
  ["@markup.link"] = { fg = c.blue },
  ["@markup.link.label"] = { fg = c.blue },
  ["@markup.link.url"] = { fg = c.blue, underline = true },
  ["@markup.raw"] = { fg = c.green },
  ["@markup.raw.block"] = { fg = c.green },
  ["@markup.list"] = { fg = c.blue },
  ["@markup.list.checked"] = { fg = c.blue },
  ["@markup.list.unchecked"] = { fg = c.blue },

  ["@diff.plus"] = { fg = c.green },
  ["@diff.minus"] = { fg = c.red },
  ["@diff.delta"] = { fg = c.yellow },

  ---------------------------------------------------------------------------
  -- LSP semantic tokens
  ---------------------------------------------------------------------------
  ["@lsp.type.class"] = { fg = c.purple },
  ["@lsp.type.comment"] = {},
  ["@lsp.type.decorator"] = { fg = c.cyan },
  ["@lsp.type.enum"] = { fg = c.white },
  ["@lsp.type.enumMember"] = { fg = c.cyan },
  ["@lsp.type.function"] = {},
  ["@lsp.type.interface"] = { fg = c.white },
  ["@lsp.type.macro"] = { fg = c.cyan },
  ["@lsp.type.method"] = {},
  ["@lsp.type.namespace"] = { fg = c.white },
  ["@lsp.type.parameter"] = { fg = c.fg },
  ["@lsp.type.property"] = { fg = c.white },
  ["@lsp.type.struct"] = { fg = c.white },
  ["@lsp.type.type"] = { fg = c.white },
  ["@lsp.type.typeParameter"] = { fg = c.white },
  ["@lsp.type.variable"] = {},
  ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.amber },
  ["@lsp.typemod.function.defaultLibrary"] = {},
  ["@lsp.typemod.function.call"] = { fg = c.white },
  ["@lsp.typemod.method.call"] = { fg = c.white },
  ["@lsp.typemod.keyword.async"] = { fg = c.purple },

  ---------------------------------------------------------------------------
  -- Diagnostics
  ---------------------------------------------------------------------------
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },

  DiagnosticVirtualTextError = { fg = c.red, bg = c.bg_highlight },
  DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.bg_highlight },
  DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.bg_highlight },
  DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.bg_highlight },
  DiagnosticVirtualTextOk = { fg = c.green, bg = c.bg_highlight },

  DiagnosticUnderlineError = { sp = c.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
  DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
  DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },
  DiagnosticUnderlineOk = { sp = c.green, undercurl = true },

  DiagnosticUnnecessary = { fg = c.bright_black },
  DiagnosticDeprecated = { strikethrough = true },

  LspReferenceText = { bg = c.bg_highlight },
  LspReferenceRead = { bg = c.bg_highlight },
  LspReferenceWrite = { bg = c.bg_highlight },
  LspInlayHint = { fg = c.gray, bg = c.bg_highlight },
  LspSignatureActiveParameter = { fg = c.yellow, bold = true },
  LspCodeLens = { fg = c.bright_black },
  LspInfoBorder = { fg = c.bright_black, bg = c.bg_float },

  ---------------------------------------------------------------------------
  -- Diff / git
  ---------------------------------------------------------------------------
  DiffAdd = { fg = c.green, bg = c.bg_highlight },
  DiffChange = { fg = c.yellow, bg = c.bg_highlight },
  DiffDelete = { fg = c.red, bg = c.bg_highlight },
  DiffText = { fg = c.bg, bg = c.yellow },
  Added = { fg = c.green },
  Changed = { fg = c.yellow },
  Removed = { fg = c.red },

  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },
  GitSignsCurrentLineBlame = { fg = c.bright_black },

  ---------------------------------------------------------------------------
  -- Plugins
  ---------------------------------------------------------------------------
  -- neo-tree
  NeoTreeNormal = { fg = c.fg, bg = c.bg },
  NeoTreeNormalNC = { fg = c.fg, bg = c.bg },
  NeoTreeWinSeparator = { fg = c.bright_black, bg = c.bg },
  NeoTreeEndOfBuffer = { fg = c.bg, bg = c.bg },
  NeoTreeRootName = { fg = c.purple, bold = true },
  NeoTreeDirectoryName = { fg = c.purple },
  NeoTreeDirectoryIcon = { fg = c.purple },
  NeoTreeFileName = { fg = c.fg },
  NeoTreeFileNameOpened = { fg = c.white, bold = true },
  NeoTreeIndentMarker = { fg = c.bright_black },
  NeoTreeGitAdded = { fg = c.green },
  NeoTreeGitModified = { fg = c.yellow },
  NeoTreeGitDeleted = { fg = c.red },
  NeoTreeGitUntracked = { fg = c.magenta },
  NeoTreeGitConflict = { fg = c.red, bold = true },
  NeoTreeGitIgnored = { fg = c.bright_black },
  NeoTreeTabActive = { fg = c.fg, bg = c.bg, bold = true },
  NeoTreeTabInactive = { fg = c.gray, bg = c.bg_highlight },
  NeoTreeTabSeparatorActive = { fg = c.bg, bg = c.bg },
  NeoTreeTabSeparatorInactive = { fg = c.bg_highlight, bg = c.bg_highlight },

  -- telescope
  TelescopeNormal = { fg = c.fg, bg = c.bg_float },
  TelescopeBorder = { fg = c.bright_black, bg = c.bg_float },
  TelescopeTitle = { fg = c.bg, bg = c.blue, bold = true },
  TelescopePromptNormal = { fg = c.fg, bg = c.bg_float },
  TelescopePromptBorder = { fg = c.bright_black, bg = c.bg_float },
  TelescopePromptTitle = { fg = c.bg, bg = c.blue, bold = true },
  TelescopePromptPrefix = { fg = c.blue },
  TelescopePreviewTitle = { fg = c.bg, bg = c.green, bold = true },
  TelescopeResultsTitle = { fg = c.bg_float, bg = c.bg_float },
  TelescopeSelection = { bg = c.selection },
  TelescopeSelectionCaret = { fg = c.blue, bg = c.selection },
  TelescopeMatching = { fg = c.yellow, bold = true },
  TelescopeMultiSelection = { fg = c.magenta },

  -- bufferline
  BufferLineFill = { bg = c.bg_highlight },
  BufferLineBackground = { fg = c.gray, bg = c.bg_highlight },
  BufferLineBufferVisible = { fg = c.gray, bg = c.bg_highlight },
  BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true },
  BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg },
  BufferLineSeparator = { fg = c.bg_highlight, bg = c.bg_highlight },
  BufferLineSeparatorSelected = { fg = c.bg_highlight, bg = c.bg },
  BufferLineModified = { fg = c.green, bg = c.bg_highlight },
  BufferLineModifiedSelected = { fg = c.green, bg = c.bg },

  -- blink.cmp
  BlinkCmpMenu = { fg = c.fg, bg = c.bg_float },
  BlinkCmpMenuBorder = { fg = c.bright_black, bg = c.bg_float },
  BlinkCmpMenuSelection = { fg = c.bg, bg = c.blue },
  BlinkCmpScrollBarThumb = { bg = c.bright_black },
  BlinkCmpScrollBarGutter = { bg = c.bg_highlight },
  BlinkCmpLabel = { fg = c.fg },
  BlinkCmpLabelDeprecated = { fg = c.bright_black, strikethrough = true },
  BlinkCmpLabelMatch = { fg = c.yellow, bold = true },
  BlinkCmpLabelDetail = { fg = c.gray },
  BlinkCmpLabelDescription = { fg = c.gray },
  BlinkCmpKind = { fg = c.cyan },
  BlinkCmpSource = { fg = c.bright_black },
  BlinkCmpGhostText = { fg = c.bright_black },
  BlinkCmpDoc = { fg = c.fg, bg = c.bg_float },
  BlinkCmpDocBorder = { fg = c.bright_black, bg = c.bg_float },
  BlinkCmpDocSeparator = { fg = c.bright_black, bg = c.bg_float },
  BlinkCmpSignatureHelp = { fg = c.fg, bg = c.bg_float },
  BlinkCmpSignatureHelpBorder = { fg = c.bright_black, bg = c.bg_float },
  BlinkCmpSignatureHelpActiveParameter = { fg = c.yellow, bold = true },

  -- snacks.nvim
  SnacksNormal = { fg = c.fg, bg = c.bg_float },
  SnacksWinBar = { fg = c.fg, bg = c.bg_highlight },
  SnacksBackdrop = { bg = c.black },
  SnacksIndent = { fg = "#2a2a2a" },
  SnacksIndentScope = { fg = c.bright_black },
  SnacksNotifierInfo = { fg = c.blue, bg = c.bg_float },
  SnacksNotifierWarn = { fg = c.yellow, bg = c.bg_float },
  SnacksNotifierError = { fg = c.red, bg = c.bg_float },
  SnacksNotifierDebug = { fg = c.gray, bg = c.bg_float },
  SnacksNotifierTrace = { fg = c.magenta, bg = c.bg_float },
  SnacksDashboardHeader = { fg = c.blue },
  SnacksDashboardIcon = { fg = c.cyan },
  SnacksDashboardDesc = { fg = c.fg },
  SnacksDashboardKey = { fg = c.magenta },
  SnacksDashboardFooter = { fg = c.gray },
  SnacksDashboardDir = { fg = c.bright_black },
  SnacksPickerMatch = { fg = c.yellow, bold = true },
  SnacksPickerDir = { fg = c.bright_black },
  SnacksPickerBorder = { fg = c.bright_black, bg = c.bg_float },
  SnacksPickerTitle = { fg = c.bg, bg = c.blue, bold = true },

  -- which-key
  WhichKey = { fg = c.magenta },
  WhichKeyGroup = { fg = c.blue },
  WhichKeyDesc = { fg = c.fg },
  WhichKeySeparator = { fg = c.bright_black },
  WhichKeyFloat = { bg = c.bg_float },
  WhichKeyBorder = { fg = c.bright_black, bg = c.bg_float },
  WhichKeyValue = { fg = c.gray },

  -- trouble / todo-comments
  TroubleNormal = { fg = c.fg, bg = c.bg },
  TroubleText = { fg = c.fg },
  TroubleCount = { fg = c.magenta, bg = c.bg_highlight },
  TodoBgFIX = { fg = c.bg, bg = c.red, bold = true },
  TodoBgTODO = { fg = c.bg, bg = c.blue, bold = true },
  TodoBgHACK = { fg = c.bg, bg = c.yellow, bold = true },
  TodoBgWARN = { fg = c.bg, bg = c.yellow, bold = true },
  TodoBgPERF = { fg = c.bg, bg = c.magenta, bold = true },
  TodoBgNOTE = { fg = c.bg, bg = c.green, bold = true },
  TodoBgTEST = { fg = c.bg, bg = c.cyan, bold = true },
  TodoFgFIX = { fg = c.red },
  TodoFgTODO = { fg = c.blue },
  TodoFgHACK = { fg = c.yellow },
  TodoFgWARN = { fg = c.yellow },
  TodoFgPERF = { fg = c.magenta },
  TodoFgNOTE = { fg = c.green },
  TodoFgTEST = { fg = c.cyan },

  -- flash.nvim
  FlashBackdrop = { fg = c.bright_black },
  FlashLabel = { fg = c.bg, bg = c.magenta, bold = true },
  FlashMatch = { fg = c.bg, bg = c.blue },
  FlashCurrent = { fg = c.bg, bg = c.yellow },

  -- mini / misc
  MiniIndentscopeSymbol = { fg = c.bright_black },
  MiniStatuslineModeNormal = { fg = c.bg, bg = c.blue, bold = true },
  MiniStatuslineModeInsert = { fg = c.bg, bg = c.green, bold = true },
  MiniStatuslineModeVisual = { fg = c.bg, bg = c.magenta, bold = true },
  MiniStatuslineModeReplace = { fg = c.bg, bg = c.red, bold = true },
  MiniStatuslineModeCommand = { fg = c.bg, bg = c.yellow, bold = true },

  -- noice
  NoiceCmdlinePopupBorder = { fg = c.bright_black },
  NoiceCmdlineIcon = { fg = c.blue },
  NoiceCmdlinePopupTitle = { fg = c.blue },
  NoiceConfirmBorder = { fg = c.bright_black },

  -- render-markdown / markdown
  RenderMarkdownCode = { bg = c.bg_highlight },
  RenderMarkdownCodeInline = { fg = c.green, bg = c.bg_highlight },
  RenderMarkdownH1Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownH2Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownH3Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownH4Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownH5Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownH6Bg = { fg = c.blue, bg = c.bg_highlight },
  RenderMarkdownBullet = { fg = c.blue },
  RenderMarkdownQuote = { fg = c.gray },
  RenderMarkdownLink = { fg = c.blue },

  -- lazy.nvim / mason
  LazyNormal = { fg = c.fg, bg = c.bg_float },
  LazyButton = { fg = c.fg, bg = c.bg_highlight },
  LazyButtonActive = { fg = c.bg, bg = c.blue, bold = true },
  LazyH1 = { fg = c.bg, bg = c.blue, bold = true },
  LazyProgressDone = { fg = c.green, bold = true },
  LazyProgressTodo = { fg = c.bright_black, bold = true },
  MasonNormal = { fg = c.fg, bg = c.bg_float },
  MasonHeader = { fg = c.bg, bg = c.blue, bold = true },
  MasonHighlight = { fg = c.blue },
  MasonHighlightBlock = { fg = c.bg, bg = c.blue },
  MasonHighlightBlockBold = { fg = c.bg, bg = c.blue, bold = true },
  MasonMuted = { fg = c.bright_black },
  MasonMutedBlock = { fg = c.fg, bg = c.bg_highlight },

  -- dashboard-nvim
  DashboardHeader = { fg = c.blue },
  DashboardIcon = { fg = c.cyan },
  DashboardDesc = { fg = c.fg },
  DashboardKey = { fg = c.magenta },
  DashboardFooter = { fg = c.gray },

  -- grug-far
  GrugFarHelpHeader = { fg = c.blue },
  GrugFarResultsPath = { fg = c.cyan },
  GrugFarResultsLineNo = { fg = c.bright_black },
  GrugFarResultsMatch = { fg = c.bg, bg = c.yellow },
}

for group, opts in pairs(hl) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Expose the palette so other config (e.g. lualine) can reuse it.
package.loaded["vercel-dark.palette"] = c
