local M = {}

function M.setup()
  local p = require("darcubox.palette").palette
  local config = require("darcubox").config
  local bg = config.options.transparent and "NONE" or p.bg

  -- stylua: ignore
  local groups = {
    -- ui elements

    -- Editor
    ColorColumn                          = { bg = bg }, -- Used for the columns set with 'ColorColumn'
    Conceal                              = { fg = p.fg }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor                               = { fg = p.gold, reverse = true }, -- The character under the cursor
    lCursor                              = { fg = p.gold, reverse = true },
    CursorIM                             = { fg = p.gold, reverse = true }, -- Like Cursor, but used when in IME mode
    CursorColumn                         = { link = "CursorLine" },
    CursorLine                           = { bg = p.surface1 },
    Directory                            = { fg = p.silver }, -- Directory names (and other special names listings)
    EndOfBuffer                          = { fg = p.surface2 },
    TermCursor                           = { fg = p.gold, reverse = true },
    TermCursorNC                         = { fg = p.gold, reverse = true },
    VertSplit                            = { fg = p.surface2 }, -- Split border
    WinSeparator                         = { link = "VertSplit" },
    Folded                               = { fg = p.surface2, italic = true },
    FoldColumn                           = { fg = p.surface2 },
    SignColumn                           = { fg = p.fg },
    SignColumnSB                         = { link = "ColorColumn" },
    Substitute                           = { fg = p.black, bg = p.sunshine },
    LineNr                               = { fg = p.surface2 },
    CursorLineNr                         = { fg = p.alabaster },
    MatchParen                           = { special = p.gold, undercurl = true },
    MsgArea                              = { link = "Normal" },
    MsgSeparator                         = { fg = p.fg, bg = bg },
    NonText                              = { fg = p.surface2 },
    Normal                               = { fg = p.fg, bg = bg,}, -- Normal text and background color
    NormalSB                             = { fg = p.surface2, bg = p.contrast }, -- normal text in sidebar
    NormalNC                             = { fg = p.surface1, bg = p.contrast }, -- normal text in non-current windows
    NormalFloat                          = { link = "Normal" }, -- Normal text and background color
    FloatBorder                          = { fg = p.sand, bg = p.contrast },
    FloatTitle                           = { fg = p.alabaster, bg = p.contrast },
    Pmenu                                = { fg = p.fg, bg = p.surface1 },
    PmenuSel                             = { fg = p.sunshine, bg = p.surface2 },
    PmenuSbar                            = { fg = p.silver, bg = p.surface2 },
    PmenuThumb                           = { fg = p.alabaster, bg = p.silver },
    Question                             = { fg = p.meadow },
    QuickFixLine                         = { fg = p.ember, bg = p.silver, reverse = true },
    Search                               = { fg = p.sunshine, reverse = true },
    IncSearch                            = { fg = p.black, bg = p.gold },
    CurSearch                            = { link = "IncSearch" },
    SpecialKey                           = { fg = p.sunshine },
    SpellBad                             = { fg = p.crimson, italic = true, undercurl = true },
    SpellCap                             = { fg = p.sand, italic = true, undercurl = true },
    SpellLocal                           = { fg = p.sapphire, italic = true, undercurl = true },
    SpellRare                            = { fg = p.lilac, italic = true, undercurl = true },
    TabLine                              = { link = "StatusLine" },
    TabLineFill                          = { fg = p.fg },
    TabLineSel                           = { fg = p.black, bg = p.fg },
    Title                                = { fg = p.alabaster },
    Visual                               = { bg = p.surface2 },
    VisualNOS                            = { bg = p.sand },
    Whitespace                           = { fg = p.surface2 },
    WildMenu                             = { fg = p.ember, bold = true },
    WinBar                               = { link = "StatusLine" }, -- window bar
    WinBarNC                             = { link = "StatusLineNC" }, -- window bar in inactive windows

    qfLineNr                             = { fg = p.ember, bg = p.silver, reverse = true },
    ToolbarLine                          = { fg = p.fg, bg = p.contrast },
    ToolbarButton                        = { fg = p.fg, bold = true },
    NormalMode                           = { fg = p.sunshine, reverse = true },
    InsertMode                           = { fg = p.lime },
    ReplaceMode                          = { fg = p.crimson },
    VisualMode                           = { fg = p.alabaster },
    CommandMode                          = { fg = p.silver },
    Warnings                             = { fg = p.warning },
    menuSel                              = { bg = p.surface2, fg = p.alabaster },

    healthError                          = { link = "Error" },
    healthSuccess                        = { fg = p.lime },
    healthWarning                        = { fg = p.warning },

    -- Syntax
    Comment                              = { fg = p.silver }, -- any comment
    Constant                             = { fg = p.meadow }, -- any constant
    String                               = { link = "Constant" }, -- any string
    Character                            = { link = "Constant" }, -- any character constant: 'c', 'n'
    Number                               = { fg = p.lime }, -- a number constant
    Boolean                              = { link = "Number" }, -- a boolean constant: TRUE, false
    Float                                = { link = "Number" }, -- floating point constant: 2.3e10

    Identifier                           = { fg = p.fg }, -- Any variable name
    Function                             = { fg = p.gold }, -- normal function name

    Statement                            = { fg = p.gold }, -- any statement
    Conditional                          = { link = "Keyword" }, -- normal if, then, else, endif, switch, etc.
    Repeat                               = { link = "Keyword" }, -- normal any other keyword
    Label                                = { fg = p.lilac }, -- case, default, etc.
    Operator                             = { fg = p.alabaster }, -- sizeof, "+", "*", etc.
    Keyword                              = { fg = p.ember }, -- normal for, do, while, etc.
    Exception                            = { fg = p.sapphire }, -- try, catch, throw

    PreProc                              = { fg = p.sunshine }, -- generic Preprocessor
    Include                              = { link = "Keyword" }, -- Preprocessor #include
    Define                               = { link = "Keyword" }, -- Preprocessor #define
    Macro                                = { fg = p.sapphire }, -- Same as Define
    PreCondit                            = { fg = p.sapphire }, -- Preprocessor #if, #else, #endif, etc.

    Type                                 = { fg = p.sapphire }, -- int, long, char, etc.
    StorageClass                         = { fg = p.sunshine }, -- static, register, volatile, etc.
    Structure                            = { fg = p.sand }, -- struct, union, enum, etc.
    Typedef                              = { fg = p.lilac }, -- A typedef

    Special                              = { fg = p.sand }, -- Any special symbol
    SpecialChar                          = { fg = p.lilac }, -- Special character in a constant
    Tag                                  = { fg = p.gold }, -- You can use CTRL-] on this
    Delimiter                            = { link = "Tag" }, -- Character that needs attention like, or.
    SpecialComment                       = { fg = p.surface2 }, -- Special things inside comment
    Debug                                = { fg = p.crimson }, -- Degugging statements
    htmlH1                               = { fg = p.sunshine, bold = true },
    htmlH2                               = { fg = p.sapphire, bold = true },

    Underlined                           = { fg = p.meadow, underline = true }, -- Text that stands out, HTML links
    Ignore                               = { fg = p.surface1 }, -- Left blank, hidden
    Error                                = { fg = p.error, bold = true, underline = true }, -- Any erroneous construct
    Todo                                 = { fg = p.sunshine, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Parameter                            = { fg = p.sunshine },
    Field                                = { fg = p.sunshine },
    Namespace                            = { fg = p.sapphire },
    Warn                                 = { fg = p.crimson },

    -- Treesitter
    ["@annotation"]                      = { link = "PreProc" },
    ["@attribute"]                       = { link = "PreProc" }, -- attribute annotations (e.g. Python decorators)
    ["@boolean"]                         = { link = "Boolean" }, -- boolean literals
    ["@character"]                       = { link = "Character" }, -- character literals
    ["@character.special"]               = { link = "SpecialChar" }, -- special characters (e.g. wildcards)
    ["@comment"]                         = { link = "Comment" }, -- line and block comments
    ["@conditional"]                     = { link = "Conditional" }, -- keywords related to conditionals (e.g. `if` / `else`)
    ["@keyword.conditional"]             = { link = "Conditional" },
    ["@constant"]                        = { link = "Constant" }, -- constant identifiers
    ["@constant.builtin"]                = { link = "Special" }, -- built-in constant values
    ["@constant.macro"]                  = { link = "Define" }, -- constants defined by the preprocessor
    ["@debug"]                           = { link = "Debug" }, -- keywords related to debugging
    ["@define"]                          = { link = "Define" }, -- preprocessor definition directives
    ["@exception"]                       = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)
    ["@field"]                           = { link = "Field" }, -- object and struct fields
    ["@float"]                           = { link = "Float" }, -- floating-point number literals
    ["@keyword.debug"]                   = { link = "Debug" },
    ["@keyword.directive.define"]        = { link = "Define" },
    ["@keyword.exception"]               = { link = "Exception" },
    ["@number.float"]                    = { link = "Float" },
    ["@function"]                        = { link = "Function" }, -- function definitions
    ["@function.builtin"]                = { link = "Special" }, -- built-in functions
    ["@function.call"]                   = { link = "@function" }, -- function calls
    ["@function.macro"]                  = { link = "Macro" }, -- preprocessor macros
    ["@keyword.import"]                  = { link = "Include" },
    ["@keyword.coroutine"]               = { link = "@keyword" }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ["@keyword.operator"]                = { link = "@operator" },
    ["@keyword.return"]                  = { link = "@keyword" },
    ["@method"]                          = { link = "Function" }, -- method definitions
    ["@method.call"]                     = { link = "@method" }, -- method calls
    ["@function.method"]                 = { link = "Function" },
    ["@function.method.call"]            = { link = "@function.method" },
    ["@namespace.builtin"]               = { link = "@variable.builtin" },
    ["@none"]                            = {},
    ["@number"]                          = { link = "Number" }, -- numeric literals
    ["@keyword.directive"]               = { link = "PreProc" },
    ["@keyword.repeat"]                  = { link = "Repeat" },
    ["@keyword.storage"]                 = { link = "StorageClass" },
    ["@storageclass"]                    = { link = "StorageClass" }, -- modifiers that affect storage in memory or life-time
    ["@string"]                          = { link = "String" }, -- string literals
    ["@markup.link.label"]               = { link = "SpecialChar" },
    ["@markup.link.label.symbol"]        = { link = "Identifier" },
    ["@tag"]                             = { link = "Label" }, -- Tags like html tag names.
    ["@tag.attribute"]                   = { link = "@property" }, -- Tags like html tag names.
    ["@tag.delimiter"]                   = { link = "Delimiter" }, -- Tag delimiter like < > /
    ["@markup"]                          = { link = "@none" },
    ["@markup.environment"]              = { link = "Macro" },
    ["@markup.environment.name"]         = { link = "Type" },
    ["@markup.raw"]                      = { link = "String" },
    ["@markup.math"]                     = { link = "Special"},
    ["@markup.strong"]                   = { bold = true },
    ["@markup.italic"]                   = { italic = true },
    ["@markup.strikethrough"]            = { strikethrough = true },
    ["@markup.underline"]                = { underline = true },
    ["@markup.heading"]                  = { link = "Title" },
    ["@comment.note"]                    = { fg = p.hint },
    ["@comment.error"]                   = { fg = p.error },
    ["@comment.hint"]                    = { fg = p.hint },
    ["@comment.info"]                    = { fg = p.info },
    ["@comment.warning"]                 = { fg = p.warning },
    ["@comment.todo"]                    = { fg = p.plus },
    ["@markup.link.url"]                 = { link = "Underlined" },
    ["@type"]                            = { link = "Type" }, -- type or class definitions and annotations
    ["@type.definition"]                 = { link = "Typedef" }, -- type definitions (e.g. `typedef` in C)
    ["@type.qualifier"]                  = { link = "@keyword" }, -- type qualifiers (e.g. `const`)

    -- Misc
    ["@comment.documentation"]           = { link = "Comment" }, -- comments documenting code
    ["@operator"]                        = { link = "Operator" }, -- symbolic operators (e.g. `+` / `*`)
    ["@parameter"]                       = { link = "Parameter" }, -- parameters of a function
    ["@error"]                           = { link = "Error" }, -- syntax/parser errors
    ["@preproc"]                         = { link = "PreProc" }, -- various preprocessor directives & shebangs
    ["@conditional.ternary"]             = { link = "Conditional" }, -- ternary operator (e.g. `?` / `:`)
    ["@repeat"]                          = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
    ["@include"]                         = { link = "Include" }, -- keywords for including modules (e.g. `import` / `from` in Python)
    ["@namespace"]                       = { link = "Namespace" }, -- modules or namespaces
    ["@symbol"]                          = { link = "Namespace" }, -- symbols or atoms

    -- Punctuation
    ["@punctuation.delimiter"]           = { fg = p.alabaster }, -- delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.bracket"]             = { fg = p.alabaster }, -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"]             = { fg = p.ember }, -- special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"]    = { fg = p.ember, bold = true},
    ["@markup.list"]                     = { fg = p.sapphire }, -- For special punctuation that does not fall in the catagories before.
    ["@markup.list.markdown"]            = { fg = p.ember, bold = true },

    -- Literals
    ["@string.documentation"]            = { fg = p.sunshine }, -- string documenting code (e.g. Python docstrings)
    ["@string.regex"]                    = { fg = p.ember }, -- regular expressions
    ["@string.escape"]                   = { fg = p.lime }, -- escape sequences

    ["@string.special"]                  = { fg = p.meadow }, -- other special strings (e.g. dates)

    -- Functions
    ["@constructor"]                     = { fg = p.sunshine }, -- constructor calls and definitions
    ["@variable.parameter"]              = { fg = p.sunshine },
    ["@variable.parameter.builtin"]      = { fg = p.ember },

    -- Keywords
    ["@keyword"]                         = { link = "Keyword" }, -- various keywords
    ["@keyword.function"]                = { link = "Keyword" }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)

    ["@label"]                           = { fg = p.lime }, -- GOTO and other labels (e.g. `label:` in C)

    -- Types
    ["@type.builtin"]                    = { link = "Type" }, -- built-in types
    ["@variable.member"]                 = { fg = p.sand }, -- For fields
    ["@property"]                        = { link = "Identifier" }, -- similar to `@field`

    -- Identifiers
    ["@variable"]                        = { link = "Identifier" }, -- various variable names
    ["@variable.builtin"]                = { fg = p.gold }, -- built-in variable names (e.g. `this`)
    ["@module.builtin"]                  = { fg = p.gold }, -- built-in variable names (e.g. `this`)

    -- Text
    ["@markup.raw.markdown"]             = { fg = p.sapphire },
    ["@markup.raw.markdown_inline"]      = { fg = p.sand, bg = p.meadow },
    ["@markup.link"]                     = { fg = p.sapphire, underline = true },

    ["@markup.list.unchecked"]           = { fg = p.sand }, -- For brackets and parens.
    ["@markup.list.checked"]             = { fg = p.lime }, -- For brackets and parens.

    ["@diff.plus"]                       = { link = "DiffAdd"},
    ["@diff.minus"]                      = { link = "DiffDelete" },
    ["@diff.delta"]                      = { link = "DiffChange" },

    ["@module"]                          = { link = "Include" },

    -- Text
    ["@text"]                            = { fg = p.fg }, -- non-structured text
    ["@text.strong"]                     = { fg = p.fg, bold = true }, -- bold text
    ["@text.emphasis"]                   = { fg = p.alabaster }, -- text with emphasis
    ["@text.underline"]                  = { fg = p.fg, underline = true }, -- underlined text
    ["@text.strike"]                     = {}, -- strikethrough text
    ["@text.title"]                      = { fg = p.alabaster, bold = true }, -- text that is part of a title
    ["@text.literal"]                    = { fg = p.fg }, -- literal or verbatim text (e.g., inline code)
    ["@text.quote"]                      = { fg = p.gold }, -- text quotations
    ["@text.uri"]                        = { fg = p.meadow }, -- URIs (e.g. hyperlinks)
    ["@text.math"]                       = { fg = p.lilac }, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@text.reference"]                  = { fg = p.gold }, -- text references, footnotes, citations, etc.

    ["@text.todo"]                       = { link = "Todo" }, -- todo notes
    ["@text.note"]                       = { link = "Todo" }, -- info notes
    ["@text.warning"]                    = { link = "Warning" }, -- warning notes
    ["@text.danger"]                     = { link = "Error" }, -- danger/error notes

    ["@text.diff.add"]                   = { link = "DiffAdd" }, -- added text (for diff files)
    ["@text.diff.delete"]                = { link = "DiffDelete" }, -- deleted text (for diff files)

    -- Tags

    -- Conceal
    ["@conceal"]                         = { link = "Conceal" }, -- for captures that are only used for concealing

    -- Treesitter
    TSAnnotation                         = { link = "@annotation" }, -- For C++/Dart attributes, annotations, that can be attached to denote some kind of meta information
    TSAttribute                          = { link = "@attribute" }, -- (unstable) TODO: docs
    TSBoolean                            = { link = "@boolean" }, -- For booleans.
    TSCharacter                          = { link = "@character" }, -- For characters.
    TSCharacterSpecial                   = { link = "@character.special" },
    TSComment                            = { link = "@comment" }, -- For comment blocks
    TSConditional                        = { link = "@keyword" }, -- For keywords related to conditionals.
    TSConstant                           = { link = "@constant" }, -- For constants
    TSConstBuiltin                       = { link = "@constant" }, -- For constant that are built in language: `nil` in Lua.
    TSConstMacro                         = { link = "@constant.macro" }, -- For constants that are defined by macros: `NULL` in C.
    TSConstructor                        = { link = "@constructor" }, -- For constructor calls and definition: `= { }` in Lua, and Java constructors.
    TSDebug                              = { link = "@debug" },
    TSDefine                             = { link = "@define" },
    TSError                              = { link = "@error" }, -- For syntax/parser errors.
    TSException                          = { link = "@exception" }, -- For exception related keywords.
    TSField                              = { link = "@field" }, -- For fields
    TSFloat                              = { link = "@float" }, -- For floats
    TSFunction                           = { link = "@function" }, -- For function (calls and definitions).
    TSFunctionCall                       = { link = "@function.call"},
    TSFuncBuiltin                        = { link = "@function.builtin" }, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro                          = { link = "@function.macro" }, -- For macro defined functions (calls and definitions): each `macro_rules` in Rust.
    TSInclude                            = { link = "@include" }, -- For includes: `#include` in C `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword                            = { link = "@keyword" }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction                    = { link = "@keyword.function" }, -- For keywords used to define a function.
    TSKeywordOperator                    = { link = "@keyword.operator" },
    TSKeywordReturn                      = { link = "@keyword.return" },
    TSLabel                              = { link = "@label" }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod                             = { link = "@method" }, -- For method calls and definitions.
    TSMethodCall                         = { link = "@method.call" },
    TSNamespace                          = { link = "@namespace" }, -- For identifiers referring to modules and namespace.
    TSNone                               = { link = "@none"},
    TSNumber                             = { link = "@number" }, -- For all numbers
    TSOperator                           = { link = "@operator" }, -- For any operator: `+` but also `->` and `*` in C.
    TSParameter                          = { link = "@parameter" }, -- For parameter of a function.
    TSParameterReference                 = { link = "@parameter.reference" }, -- For references to parameters of a function.
    TSPreProc                            = { link = "@preproc" },
    TSProperty                           = { link = "property" }, -- Same as `TSField`
    TSPunctDelimiter                     = { link = "@punctuation.delimiter" }, -- For delimiters ie: `.`
    TSPunctBracket                       = { link = "@punctuation.bracket" }, -- For brackets and parens.
    TSPunctSpecial                       = { link = "@punctuation.special" }, -- For special punctutation that does not fall in the categories before.
    TSRepeat                             = { link = "@repeat" }, -- For keywords related to loops.
    TSStorageClass                       = { link = "@storageclass" },
    TSString                             = { link = "@string" }, -- For strings.
    TSStringRegex                        = { link = "@string.regex" }, -- For regexes.
    TSStringEscape                       = { link = "@string.escape" }, -- For escape characters within a string.
    TSStringSpecial                      = { link = "@string.special" },
    TSSymbol                             = { link = "@symbol" }, -- For identifiers referring to symbols or atoms.
    TSTag                                = { link = "@tag" }, -- Tags like html tag names.
    TSTagAttribute                       = { link = "@tag.attribute" },
    TSTagDelimiter                       = { link = "@tag.delimiter" }, -- Tag delimiter like `<` `>` `/`
    TSText                               = { link = "@text" }, -- For strings considered text in a markup language.
    TSStrong                             = { link = "@text.strong" },
    TSEmphasis                           = { link = "@text.emphasis" }, -- For text to be represented with emphasis.
    TSUnderline                          = { link = "@text.underline" }, -- For text to be represented with an underline.
    TSStrike                             = { link = "@text.strike" }, -- For strikethrough text.
    TSTitle                              = { link = "@text.title" }, -- Text that is part of a title.
    TSLiteral                            = { link = "@text.literal" }, -- Literal text.
    TSURI                                = { link = "@text.uri" }, -- Any URI like a link or email.
    TSMath                               = { link = "@text.math" },
    TSTextReference                      = { link = "@text.reference" }, -- FIXME
    TSEnvironment                        = { link = "@text.environment" },
    TSEnvironmentName                    = { link = "@text.environment.name" },
    TSNote                               = { link = "@text.note" },
    TSWarning                            = { link = "@text.warning" },
    TSDanger                             = { link = "@text.danger" },
    TSTodo                               = { link = "@text.todo" },
    TSType                               = { link = "@type" }, -- For types.
    TSTypeBuiltin                        = { link = "@type.builtin" }, -- For builtin types.
    TSTypeQualifier                      = { link = "@type.qualifier" },
    TSTypeDefinition                     = { link = "@type.definition" },
    TSVariable                           = { link = "@variable" }, -- Any variable name that does have another highlight.
    TSVariableBuiltin                    = { link = "@variable.builtin" }, -- Variable names that are defined by the languages, likes `this` or `self`.

    -- rainbow-delimiters
    RainbowDelimiterRed                  = { fg = p.crimson },
    RainbowDelimiterYellow               = { fg = p.gold },
    RainbowDelimiterBlue                 = { fg = p.alabaster },
    RainbowDelimiterOrange               = { fg = p.sunshine },
    RainbowDelimiterGreen                = { fg = p.meadow },
    RainbowDelimiterViolet               = { fg = p.lilac },
    RainbowDelimiterCyan                 = { fg = p.sapphire },

    -- LSP
    LspDiagnosticsError                  = { fg = p.error, bg = p.error_bg },
    LspDiagnosticsDefaultError           = { fg = p.error, bg = p.error_bg }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsSignError              = { fg = p.error }, -- Used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError          = { fg = p.error, bg = p.error_bg }, -- Used for "Error" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextError       = { fg = p.error, bg = p.error_bg }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError         = { undercurl = true, special = p.error }, -- Used to underline "Error" diagnostic
    DiagnosticError                      = { fg = p.error },
    DiagnosticSignError                  = { fg = p.error },
    DiagnosticUnderlineError             = { undercurl = true, special = p.error },
    DiagnosticFloatingError              = { fg = p.error, bg = p.error_bg },
    DiagnosticVirtualTextError           = { fg = p.error, bg = p.error_bg },

    LspDiagnosticsWarning                = { fg = p.warning, bg = p.warning_bg },
    LspDiagnosticsDefaultWarning         = { fg = p.warning, bg = p.warning_bg }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsSignWarning            = { fg = p.warning }, -- Used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning        = { fg = p.warning, bg = p.warning_bg }, -- Used for "Warning" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextWarning     = { fg = p.warning, bg = p.warning_bg }, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning       = { undercurl = true, special = p.warning }, -- Used to underline "Warning" diagnostic
    DiagnosticSignWarning                = { fg = p.warning },
    DiagnosticUnderlineWarn              = { undercurl = true, special = p.warning },
    DiagnosticVirtualTextWarn            = { fg = p.warning, bg = p.warning_bg },
    DiagnosticFloatingWarn               = { fg = p.warning, bg = p.warning_bg },

    LspDiagnosticsInformation            = { fg = p.info, bg = p.info_bg },
    LspDiagnosticsDefaultInformation     = { fg = p.info_bg, bg = p.info_bg }, -- Used for "information" diagnostic virtual text
    LspDiagnosticsSignInformation        = { fg = p.info }, -- Used for "information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation    = { fg = p.info, bg = p.info_bg }, -- Used for "information" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextInformation = { fg = p.info, bg = p.info_bg }, -- Virtual text "information"
    LspDiagnosticsUnderlineInformation   = { undercurl = true, special = p.info_bg }, -- Used to underline "information" diagnostic
    DiagnosticSignInformation            = { fg = p.info },

    LspDiagnosticsInfo                   = { fg = p.info, bg = p.info_bg },
    LspDiagnosticsDefaultInfo            = { fg = p.info, bg = p.info_bg }, -- Used for "info" diagnostic virtual text
    LspDiagnosticsSignInfo               = { fg = p.info }, -- Used for "info" diagnostic signs in sign column
    LspDiagnosticsFloatingInfo           = { fg = p.info, bg = p.info_bg }, -- Used for "info" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextInfo        = { fg = p.info, bg = p.info_bg }, -- Virtual text "info"
    LspDiagnosticsUnderlineInfo          = { undercurl = true, special = p.info }, -- Used to underline "info" diagnostic
    DiagnosticInfo                       = { fg = p.info },
    DiagnosticSignInfo                   = { fg = p.info },
    DiagnosticFloatingInfo               = { fg = p.info, bg = p.info_bg },
    DiagnosticVirtualTextInfo            = { fg = p.info, bg = p.info_bg },
    DiagnosticUnderlineInfo              = { undercurl = true, special = p.info },

    LspDiagnosticsHint                   = { fg = p.hint, bg = p.hint_bg },
    LspDiagnosticsDefaultHint            = { fg = p.hint, bg = p.hint_bg }, -- Used for "hint" diagnostic virtual text
    LspDiagnosticsSignHint               = { fg = p.hint }, -- Used for "hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint           = { fg = p.hint, bg = p.hint_bg }, -- Used for "hint" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextHint        = { fg = p.hint, bg = p.hint_bg }, -- Virtual text "hint"
    LspDiagnosticsUnderlineHint          = { undercurl = true, special = p.hint }, -- Used to underline "hint" diagnostic
    DiagnosticHint                       = { fg = p.hint },
    DiagnosticSignHint                   = { fg = p.hint },
    DiagnosticFloatingHint               = { fg = p.hint, bg = p.hint_bg },
    DiagnosticVirtualTextHint            = { fg = p.hint, bg = p.hint_bg },
    DiagnosticUnderlineHint              = { undercurl = true, special = p.hint },

    DiagnosticOther                      = { fg = p.silver },
    DiagnosticSignOther                  = { fg = p.silver },

    LspReferenceRead                     = { bg = p.info_bg }, -- Used for highlight "text" reference
    LspReferenceText                     = { bg = p.info_bg }, -- Used for highlight "text" reference
    LspReferenceWrite                    = { bg = p.info_bg }, -- Used for highlight "text" reference

    -- Git
    DiffAdd                              = { fg = p.plus }, -- diff mode: Added line
    DiffChange                           = { fg = p.hint }, -- diff mode: Changed line
    DiffDelete                           = { fg = p.error }, -- diff mode: Deleted line
    DiffText                             = { fg = p.warning }, -- diff mode: Changed text within a changed line
    diffAdded                            = { link = "DiffAdd" },
    diffRemoved                          = { link = "DiffDelete" },
    diffChanged                          = { link = "DiffChange" },

    SignAdd                              = { link = "DiffAdd" },
    GitSignsAdd                          = { link = "DiffAdd" },
    GitSignsAddNr                        = { link = "DiffAdd" },
    GitSignsAddLn                        = { link = "DiffAdd" },

    SignChange                           = { link = "DiffChange" },
    GitSignsChange                       = { link = "DiffChange" },
    GitSignsChangeNr                     = { link = "DiffChange" },
    GitSignsChangeLn                     = { link = "DiffChange" },

    SignDelete                           = { link = "DiffDelete" },
    GitSignsDelete                       = { link = "DiffDelete" },
    GitSignsDeleteNr                     = { link = "DiffDelete" },
    GitSignsDeleteLn                     = { link = "DiffDelete" },

    GitSignsAddInline                    = { link = "DiffAdd" },
    GitSignsChangeInline                 = { link = "DiffChange" },
    GitSignsDeleteInline                 = { link = "DiffDelete" },

    -- Telescope
    TelescopePromptBorder                = { fg = p.gold },
    TelescopeResultsBorder               = { fg = p.gold },
    TelescopePreviewBorder               = { fg = p.lime },
    TelescopeSelectionCaret              = { fg = p.sand },
    TelescopeSelection                   = { fg = p.sunshine },
    TelescopeMatching                    = { fg = p.sapphire },
    TelescopeNormal                      = { fg = p.fg, bg = bg },

    -- Whichkey
    WhichKey                             = { fg = p.alabaster, bold = true },
    WhichKeyGroup                        = { fg = p.fg },
    WhichKeyDesc                         = { fg = p.sapphire, italic = true },
    WhichKeySeperator                    = { fg = p.fg },
    WhichKeyFloating                     = { bg = p.lime },
    WhichKeyFloat                        = { bg = p.lime },

    -- LspSaga
    DiagnosticWarning                    = { fg = p.warning },
    DiagnosticInformation                = { fg = p.info },
    DiagnosticTruncateLine               = { fg = p.fg },
    LspFloatWinNormal                    = { fg = p.contrast },
    LspFloatWinBorder                    = { fg = p.sunshine },
    LspSagaBorderTitle                   = { fg = p.sapphire },
    LspSagaHoverBorder                   = { fg = p.gold },
    LspSagaRenameBorder                  = { fg = p.meadow },
    LspSagaDefPreviewBorder              = { fg = p.meadow },
    LspSagaCodeActionBorder              = { fg = p.sapphire },
    LspSagaFinderSelection               = { fg = p.meadow },
    LspSagaCodeActionTitle               = { fg = p.sunshine },
    LspSagaCodeActionContent             = { fg = p.sunshine },
    LspSagaSignatureHelpBorder           = { fg = p.lilac },
    ReferencesCount                      = { fg = p.sunshine },
    DefinitionCount                      = { fg = p.sunshine },
    DefinitionIcon                       = { fg = p.sapphire },
    ReferencesIcon                       = { fg = p.sapphire },
    TargetWord                           = { fg = p.ember },

    -- StatusLine
    StatusLine                           = { fg = p.silver, bg = p.black },
    StatusLineNC                         = { fg = p.fg, bg = p.black },
    StatusLineTerm                       = { fg = p.fg, bg = p.contrast },
    StatusLineTermNC                     = { fg = p.fg, bg = p.black },

    -- BufferLine
    BufferLineIndicatorSelected          = { fg = p.alabaster },
    BufferLineFill                       = { bg = p.black },
    -- BufferLineSeparator               = 'bg_alt bg_alt',
    -- BufferLineSeparatorSelected       = 'bg_alt bg',
    -- BufferLineBufferSelected          = 'yellow - b',

    -- IndentBlankline -- Version 2
    IndentBlanklineChar                  = { fg = p.surface2 },
    IndentBlanklineContextChar           = { fg = p.gold },
    -- IndentBlanklineContextStart       = '- - u',
    -- IndentBlanklineSpaceChar          = 'cyan',
    -- IndentBlanklineSpaceCharBlankline = 'yellow',

    -- IndentBlankline -- Version 3
    IblIndent                            = { link = "IndentBlanklineChar" },
    IblScope                             = { link = "IndentBlanklineContextChar" },

    -- Dashboard
    DashboardShortCut                    = { fg = p.sunshine },
    DashboardHeader                      = { fg = p.crimson },
    DashboardCenter                      = { fg = p.sapphire },
    DashboardFooter                      = { fg = p.meadow, italic = true },

    -- alerts
    ErrorMsg                             = { fg = p.error },
    ModeMsg                              = { fg = p.sapphire },
    MoreMsg                              = { fg = p.sapphire },
    WarningMsg                           = { fg = p.warning },
  }

  -- apply userconfig
  groups.Comment = vim.tbl_extend("keep", groups.Comment, config.options.styles.comments)
  groups.Function = vim.tbl_extend("keep", groups.Function, config.options.styles.functions)
  groups.Keyword = vim.tbl_extend("keep", groups.Keyword, config.options.styles.keywords)
  groups.Type = vim.tbl_extend("keep", groups.Type, config.options.styles.types)

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
