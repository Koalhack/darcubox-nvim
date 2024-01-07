local M = {}

function M.setup()
  local config    = require("darcubox").config
  local p         = require("darcubox.palette").palette

  local bg        = config.options.transparent and "NONE" or p.bg

  local groups    = {

    -- ui elements
    WinSeparator                         = { link = 'VertSplit' },
    Substitute                           = { fg = p.black, bg = p.sunshine },
    Whitespace                           = { fg = p.surface2 },

    -- Editor
    Normal                               = { bg = bg, fg = p.fg }, -- Normal text and background color
    SignColumn                           = { link = 'ColorColumn' },

    VertSplit                            = { fg = p.surface2 },             -- Split border

    NormalFloat                          = { link = 'Normal' },             -- Normal text and background color
    ColorColumn                          = { bg = bg },                     -- Used for the columns set with 'ColorColumn'
    Conceal                              = { fg = p.fg },                   -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor                               = { fg = p.gold, reverse = true }, -- The character under the cursor
    CursorIM                             = { fg = p.gold, reverse = true }, -- Like Cursor, but used when in IME mode
    lCursor                              = { fg = p.gold, reverse = true },
    TermCursor                           = { fg = p.gold, reverse = true },
    TermCursorNC                         = { fg = p.gold, reverse = true },
    Directory                            = { fg = p.silver }, -- Directory names (and other special names listings)
    EndOfBuffer                          = { fg = p.surface2 },
    Folded                               = { fg = p.surface2, italic = true },
    FoldColumn                           = { fg = p.surface2 },
    IncSearch                            = { fg = p.black, bg = p.gold },
    LineNr                               = { fg = p.surface2 },
    CursorLineNr                         = { fg = p.alabaster },
    MatchParen                           = { bg = p.gold, fg = p.black },
    MsgSeparator                         = { fg = p.fg, bg = bg },
    MsgArea                              = { link = 'Normal' },
    NonText                              = { fg = p.surface2 },
    Pmenu                                = { fg = p.fg, bg = p.surface1 },
    PmenuSel                             = { fg = p.sunshine, bg = p.surface2 },
    PmenuSbar                            = { fg = p.silver, bg = p.surface2 },
    PmenuThumb                           = { fg = p.alabaster, bg = p.silver },
    Question                             = { fg = p.meadow },
    QuickFixLine                         = { fg = p.ember, bg = p.silver, reverse = true },
    qfLineNr                             = { fg = p.ember, bg = p.silver, reverse = true },
    Search                               = { bg = p.ember, fg = p.black },
    SpecialKey                           = { fg = p.sunshine },
    SpellBad                             = { fg = p.crimson, italic = true, undercurl = true },
    SpellCap                             = { fg = p.sand, italic = true, undercurl = true },
    SpellLocal                           = { fg = p.sapphire, italic = true, undercurl = true },
    SpellRare                            = { fg = p.lilac, italic = true, undercurl = true },
    TabLineFill                          = { fg = p.fg },
    TabLineSel                           = { fg = p.black, bg = p.fg },
    TabLine                              = { link = 'StatusLine' },
    Title                                = { fg = p.alabaster },
    Visual                               = { bg = p.surface2 },
    VisualNOS                            = { bg = p.sand },
    WildMenu                             = { fg = p.ember, bold = true },
    CursorLine                           = { bg = p.surface1 },
    CursorColumn                         = { link = 'CursorLine' },
    ToolbarLine                          = { fg = p.fg, bg = p.contrast },
    ToolbarButton                        = { fg = p.fg, bold = true },
    NormalMode                           = { fg = p.sunshine, reverse = true },
    InsertMode                           = { fg = p.lime },
    ReplaceMode                          = { fg = p.crimson },
    VisualMode                           = { fg = p.alabaster },
    CommandMode                          = { fg = p.silver },
    Warnings                             = { fg = p.warning_bg },
    menuSel                              = { bg = p.surface2, fg = p.alabaster },

    healthError                          = { link = 'Error' },
    healthSuccess                        = { fg = p.lime },
    healthWarning                        = { fg = p.warning_bg },

    -- Syntax
    Type                                 = { fg = p.sapphire },                             -- int, long, char, etc.
    StorageClass                         = { fg = p.sunshine },                             -- static, register, volatile, etc.
    Structure                            = { fg = p.sand },                                 -- struct, union, enum, etc.
    Constant                             = { fg = p.meadow },                               -- any constant
    String                               = { link = 'Constant' },                           -- Any string
    Number                               = { fg = p.lime },                                 -- a number constant
    Character                            = { link = "Number" },                             -- any character constant: 'c', 'n'
    Boolean                              = { link = "Number" },                             -- a boolean constant: TRUE, false
    Float                                = { link = "Number" },                             -- floating point constant: 2.3e10
    Statement                            = { fg = p.gold },                                 -- any statement
    Label                                = { fg = p.lilac },                                -- case, default, etc.
    Operator                             = { fg = p.alabaster },                            -- sizeof, "+", "*", etc.
    Exception                            = { fg = p.sapphire },                             -- try, catch, throw
    PreProc                              = { link = 'Operator' },                           -- generic Preprocessor
    Include                              = { link = 'Keyword' },                            -- Preprocessor #include
    Define                               = { link = 'Keyword' },                            -- Preprocessor #define
    Macro                                = { fg = p.sapphire },                             -- Same as Define
    Typedef                              = { fg = p.lilac },                                -- A typedef
    PreCondit                            = { fg = p.sapphire },                             -- Preprocessor #if, #else, #endif, etc.
    Special                              = { fg = p.fg },                                   -- Any special symbol
    SpecialChar                          = { fg = p.lilac },                                -- Special character in a constant
    Tag                                  = { fg = p.gold },                                 -- You can use CTRL-] on this
    Delimiter                            = { link = 'Tag' },                                -- Character that needs attention like, or.
    SpecialComment                       = { fg = p.surface2 },                             -- Special things inside comment
    Debug                                = { fg = p.crimson },                              -- Degugging statements
    Underlined                           = { fg = p.meadow, underline = true },             -- Text that stands out, HTML links
    Ignore                               = { fg = p.surface1 },                             -- Left blank, hidden
    Error                                = { fg = p.error, bold = true, underline = true }, -- Any erroneous construct
    Todo                                 = { fg = p.sunshine, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Parameter                            = { fg = p.sunshine },
    Field                                = { fg = p.sunshine },
    Namespace                            = { fg = p.sapphire },
    Warn                                 = { fg = p.crimson },

    Comment                              = { fg = p.silver },

    Keyword                              = { fg = p.ember },      -- normal for, do, while, etc.
    Conditional                          = { link = 'Keyword' },  -- normal if, then, else, endif, switch, etc.
    Repeat                               = { link = 'Keyword' },  -- normal any other keyword

    Function                             = { fg = p.foreground }, -- normal function name

    Identifier                           = { fg = p.fg },         -- Any variable name

    -- Treesitter
    TSAnnotation                         = { fg = p.sand },                 -- For C++/Dart attributes, annotations, that can be attached to denote some kind of meta information
    TSAttribute                          = { fg = p.sand },                 -- (unstable) TODO: docs
    TSBoolean                            = { link = "Number" },             -- For booleans.
    TSCharacter                          = { link = "Number" },             -- For characters.
    TSConstructor                        = { fg = p.gold },                 -- For constructor calls and definition: `= { }` in Lua, and Java constructors.
    TSConstant                           = { link = 'Constant' },           -- For constants
    TSConstBuiltin                       = { link = 'Constant' },           -- For constant that are built in language: `nil` in Lua.
    TSConstMacro                         = { link = 'Macro' },              -- For constants that are defined by macros: `NULL` in C.
    TSError                              = { fg = p.error },                -- For syntax/parser errors.
    TSException                          = { link = 'Exception' },          -- For exception related keywords.
    TSField                              = { link = 'Field' },              -- For fields
    TSFloat                              = { link = 'Float' },              -- For floats
    TSFuncMacro                          = { link = 'Macro' },              -- For macro defined functions (calls and definitions): each `macro_rules` in Rust.
    TSInclude                            = { link = 'Include' },            -- For includes: `#include` in C `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel                              = { link = 'Label' },              -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace                          = { link = 'Namespace' },          -- For identifiers referring to modules and namespace.
    TSNumber                             = { link = 'Number' },             -- For all numbers
    TSOperator                           = { link = 'Operator' },           -- For any operator: `+` but also `->` and `*` in C.
    TSParameter                          = { link = 'Parameter' },          -- For parameter of a function.
    TSParameterReference                 = { link = 'Parameter' },          -- For references to parameters of a function.
    TSProperty                           = { fg = p.gold },                 -- Same as `TSField`
    TSPunctDelimiter                     = { fg = p.sapphire },             -- For delimiters ie: `.`
    TSPunctBracket                       = { fg = p.sapphire },             -- For brackets and parens.
    TSPunctSpecial                       = { fg = p.sapphire },             -- For special punctutation that does not fall in the categories before.
    TSString                             = { link = 'String' },             -- For strings.
    TSStringRegex                        = { fg = p.ember },                -- For regexes.
    TSStringEscape                       = { fg = p.gold },                 -- For escape characters within a string.
    TSSymbol                             = { link = 'Symbol' },             -- For identifiers referring to symbols or atoms.
    TSType                               = { link = 'Type' },               -- For types.
    TSTypeBuiltin                        = { link = 'Type' },               -- For builtin types.
    TSTag                                = { link = 'Tag' },                -- Tags like html tag names.
    TSTagDelimiter                       = { link = 'Delimiter' },          -- Tag delimiter like `<` `>` `/`
    TSText                               = { fg = p.fg },                   -- For strings considered text in a markup language.
    TSTextReference                      = { fg = p.gold },                 -- FIXME
    TSEmphasis                           = { fg = p.alabaster },            -- For text to be represented with emphasis.
    TSUnderline                          = { fg = p.fg, underline = true }, -- For text to be represented with an underline.
    TSStrike                             = {},                              -- For strikethrough text.
    TSTitle                              = { link = 'Title' },              -- Text that is part of a title.
    TSLiteral                            = { fg = p.fg },                   -- Literal text.
    TSURI                                = { fg = p.meadow },               -- Any URI like a link or email.

    TSComment                            = { link = "Comment" },            -- For comment blocks

    TSConditional                        = { link = 'Keyword' },            -- For keywords related to conditionals.
    TSKeyword                            = { link = 'Keyword' },            -- For keywords that don't fall in previous categories.
    TSRepeat                             = { link = 'Keyword' },            -- For keywords related to loops.
    TSKeywordFunction                    = { link = 'Keyword' },            -- For keywords used to define a function.

    TSFunction                           = { link = 'Function' },           -- For function (calls and definitions).
    TSMethod                             = { link = 'Function' },           -- For method calls and definitions.
    TSFuncBuiltin                        = { link = 'Function' },           -- For builtin functions: `table.insert` in Lua.

    TSVariable                           = { link = 'Identifier' },         -- Any variable name that does have another highlight.
    TSVariableBuiltin                    = { link = 'Identifier' },         -- Variable names that are defined by the languages, likes `this` or `self`.

    -- Misc
    ['@comment']                         = { link = 'Comment' },  -- line and block comments
    ['@comment.documentation']           = { link = 'Comment' },  -- comments documenting code
    ['@error']                           = { link = 'Error' },    -- syntax/parser errors
    --['@none'] = '-',                 -- completely disable the highlight
    ['@preproc']                         = { link = 'PreProc' },  -- various preprocessor directives & shebangs
    ['@define']                          = { link = 'Define' },   -- preprocessor definition directives
    ['@operator']                        = { link = 'Operator' }, -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ['@punctuation.delimiter']           = { link = 'Delimiter' }, -- delimiters (e.g. `;` / `.` / `,`)
    ['@punctuation.bracket']             = { fg = p.sapphire },    -- brackets (e.g. `()` / `{}` / `[]`)
    ['@punctuation.special']             = { fg = p.ember },       -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    ['@string']                          = { link = 'String' },      -- string literals
    ['@string.documentation']            = { fg = p.sunshine },      -- string documenting code (e.g. Python docstrings)
    ['@string.regex']                    = { fg = p.ember },         -- regular expressions
    ['@string.escape']                   = { fg = p.lime },          -- escape sequences
    ['@string.special']                  = { fg = p.meadow },        -- other special strings (e.g. dates)

    ['@character']                       = { link = 'Character' },   -- character literals
    ['@character.special']               = { link = 'SpecialChar' }, -- special characters (e.g. wildcards)

    ['@boolean']                         = { link = 'Boolean' },     -- boolean literals
    ['@number']                          = { link = 'Number' },      -- numeric literals
    ['@float']                           = { link = 'Float' },       -- floating-point number literals

    -- Functions
    ['@function']                        = { link = 'Function' },  -- function definitions
    ['@function.builtin']                = { link = '@function' }, -- built-in functions
    ['@function.call']                   = { link = '@function' }, -- function calls
    ['@function.macro']                  = { link = 'Macro' },     -- preprocessor macros

    ['@method']                          = { link = 'Function' },  -- method definitions
    ['@method.call']                     = { link = '@method' },   -- method calls

    ['@constructor']                     = { fg = p.gold },        -- constructor calls and definitions
    ['@parameter']                       = { link = 'Parameter' }, -- parameters of a function

    -- Keywords
    ['@keyword']                         = { link = 'Keyword' },     -- various keywords
    ['@keyword.coroutine']               = { link = 'Keyword' },     -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ['@keyword.function']                = { link = 'Keyword' },     -- keywords that define a function (e.g. `func` in Go, `def` in Python)

    ['@conditional']                     = { link = 'Conditional' }, -- keywords related to conditionals (e.g. `if` / `else`)
    ['@conditional.ternary']             = { link = 'Conditional' }, -- ternary operator (e.g. `?` / `:`)

    ['@repeat']                          = { link = 'Repeat' },      -- keywords related to loops (e.g. `for` / `while`)
    ['@debug']                           = { link = 'Debug' },       -- keywords related to debugging
    ['@label']                           = { link = 'Label' },       -- GOTO and other labels (e.g. `label:` in C)
    ['@include']                         = { link = 'Include' },     -- keywords for including modules (e.g. `import` / `from` in Python)
    ['@exception']                       = { link = 'Exception' },   -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Types
    ['@type']                            = { link = 'Type' },         -- type or class definitions and annotations
    ['@type.builtin']                    = { link = 'Type' },         -- built-in types
    ['@type.definition']                 = { link = 'Type' },         -- type definitions (e.g. `typedef` in C)
    ['@type.qualifier']                  = { link = 'Type' },         -- type qualifiers (e.g. `const`)

    ['@storageclass']                    = { link = 'StorageClass' }, -- modifiers that affect storage in memory or life-time
    ['@attribute']                       = { fg = p.sand },           -- attribute annotations (e.g. Python decorators)
    ['@field']                           = { link = 'Field' },        -- object and struct fields
    ['@property']                        = { fg = p.gold },           -- similar to `@field`

    -- Identifiers
    ['@variable']                        = { link = 'Identifier' }, -- various variable names
    ['@variable.builtin']                = { link = '@variable' },  -- built-in variable names (e.g. `this`)

    ['@constant']                        = { link = 'Constant' },   -- constant identifiers
    ['@constant.builtin']                = { link = 'Constant' },   -- built-in constant values
    ['@constant.macro']                  = { link = 'Constant' },   -- constants defined by the preprocessor

    ['@namespace']                       = { link = 'Namespace' },  -- modules or namespaces
    ['@symbol']                          = { link = 'Namespace' },  -- symbols or atoms

    -- Text
    ['@text']                            = { fg = p.fg },                     -- non-structured text
    ['@text.strong']                     = { fg = p.fg, bold = true },        -- bold text
    ['@text.emphasis']                   = { fg = p.alabaster },              -- text with emphasis
    ['@text.underline']                  = { fg = p.fg, underline = true },   -- underlined text
    ['@text.strike']                     = {},                                -- strikethrough text
    ['@text.title']                      = { fg = p.alabaster, bold = true }, -- text that is part of a title
    ['@text.literal']                    = { fg = p.fg },                     -- literal or verbatim text (e.g., inline code)
    ['@text.quote']                      = { fg = p.gold },                   -- text quotations
    ['@text.uri']                        = { fg = p.meadow },                 -- URIs (e.g. hyperlinks)
    ['@text.math']                       = { fg = p.lilac },                  -- math environments (e.g. `$ ... $` in LaTeX)
    ['@text.reference']                  = { fg = p.gold },                   -- text references, footnotes, citations, etc.

    ['@text.todo']                       = { link = 'Todo' },                 -- todo notes
    ['@text.note']                       = { link = 'Todo' },                 -- info notes
    ['@text.warning']                    = { link = 'Warning' },              -- warning notes
    ['@text.danger']                     = { link = 'Error' },                -- danger/error notes

    ['@text.diff.add']                   = { link = 'DiffAdd' },              -- added text (for diff files)
    ['@text.diff.delete']                = { link = 'DiffDelete' },           -- deleted text (for diff files)

    -- Tags
    ["@tag"]                             = { fg = p.gold }, -- Tags like html tag names.
    ["@tag.attribute"]                   = { fg = p.sand }, -- Tags like html tag names.
    ["@tag.delimiter"]                   = { fg = p.gold }, -- Tag delimiter like < > /

    -- Conceal
    ['@conceal']                         = { link = 'Conceal' }, -- for captures that are only used for concealing

    -- rainbow-delimiters
    RainbowDelimiterRed                  = { fg = p.crimson },
    RainbowDelimiterYellow               = { fg = p.gold },
    RainbowDelimiterBlue                 = { fg = p.alabaster },
    RainbowDelimiterOrange               = { fg = p.sunshine },
    RainbowDelimiterGreen                = { fg = p.meadow },
    RainbowDelimiterViolet               = { fg = p.lilac },
    RainbowDelimiterCyan                 = { fg = p.sapphire },

    -- LSP
    LspDiagnosticsError                  = { fg = p.error },
    LspDiagnosticsDefaultError           = { fg = p.error },                        -- Used for "Error" diagnostic virtual text
    LspDiagnosticsSignError              = { fg = p.error },                        -- Used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError          = { fg = p.error },                        -- Used for "Error" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextError       = { fg = p.error },                        -- Virtual text "Error"
    LspDiagnosticsUnderlineError         = { undercurl = true, special = p.error }, -- Used to underline "Error" diagnostic
    DiagnosticError                      = { fg = p.error },
    DiagnosticSignError                  = { fg = p.error },
    DiagnosticUnderlineError             = { fg = p.error },
    DiagnosticFloatingError              = { fg = p.error },
    DiagnosticVirtualTextError           = { fg = p.error },

    LspDiagnosticsWarning                = { fg = p.warning_bg },
    LspDiagnosticsDefaultWarning         = { fg = p.warning_bg },                        -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsSignWarning            = { fg = p.warning_bg },                        -- Used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning        = { fg = p.warning_bg },                        -- Used for "Warning" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextWarning     = { fg = p.warning_bg },                        -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning       = { undercurl = true, special = p.warning_bg }, -- Used to underline "Warning" diagnostic
    DiagnosticSignWarning                = { fg = p.warning_bg },
    DiagnosticUnderlineWarn              = { fg = p.warning_bg },
    DiagnosticVirtualTextWarn            = { fg = p.warning_bg },
    DiagnosticFloatingWarn               = { fg = p.warning_bg },

    LspDiagnosticsInformation            = { fg = p.info_bg },
    LspDiagnosticsDefaultInformation     = { fg = p.info_bg },                        -- Used for "information" diagnostic virtual text
    LspDiagnosticsSignInformation        = { fg = p.info_bg },                        -- Used for "information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation    = { fg = p.info_bg },                        -- Used for "information" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextInformation = { fg = p.info_bg },                        -- Virtual text "information"
    LspDiagnosticsUnderlineInformation   = { undercurl = true, special = p.info_bg }, -- Used to underline "information" diagnostic
    DiagnosticSignInformation            = { fg = p.info_bg },

    LspDiagnosticsInfo                   = { fg = p.info_bg },
    LspDiagnosticsDefaultInfo            = { fg = p.info_bg },                        -- Used for "info" diagnostic virtual text
    LspDiagnosticsSignInfo               = { fg = p.info_bg },                        -- Used for "info" diagnostic signs in sign column
    LspDiagnosticsFloatingInfo           = { fg = p.info_bg },                        -- Used for "info" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextInfo        = { fg = p.info_bg },                        -- Virtual text "info"
    LspDiagnosticsUnderlineInfo          = { undercurl = true, special = p.info_bg }, -- Used to underline "info" diagnostic
    DiagnosticInfo                       = { fg = p.info_bg },
    DiagnosticSignInfo                   = { fg = p.info_bg },
    DiagnosticFloatingInfo               = { fg = p.info_bg },
    DiagnosticVirtualTextInfo            = { fg = p.info_bg },
    DiagnosticUnderlineInfo              = { fg = p.info_bg },

    LspDiagnosticsHint                   = { fg = p.hint_bg },
    LspDiagnosticsDefaultHint            = { fg = p.hint_bg },                        -- Used for "hint" diagnostic virtual text
    LspDiagnosticsSignHint               = { fg = p.hint_bg },                        -- Used for "hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint           = { fg = p.hint_bg },                        -- Used for "hint" diagnostic messages in the diagnostic float
    LspDiagnosticsVirtualTextHint        = { fg = p.hint_bg },                        -- Virtual text "hint"
    LspDiagnosticsUnderlineHint          = { undercurl = true, special = p.hint_bg }, -- Used to underline "hint" diagnostic
    DiagnosticHint                       = { fg = p.hint_bg },
    DiagnosticSignHint                   = { fg = p.hint_bg },
    DiagnosticFloatingHint               = { fg = p.hint_bg },
    DiagnosticVirtualTextHint            = { fg = p.hint_bg },
    DiagnosticUnderlineHint              = { fg = p.hint_bg },

    DiagnosticOther                      = { fg = p.silver },
    DiagnosticSignOther                  = { fg = p.silver },

    LspReferenceText                     = { fg = p.sunshine, bg = p.gold }, -- Used for highlight "text" reference
    LspReferenceRead                     = { fg = p.sunshine, bg = p.gold }, -- Used for highlight "text" reference
    LspReferenceWrite                    = { fg = p.sunshine, bg = p.gold }, -- Used for highlight "text" reference

    -- Git

    DiffAdd                              = { fg = p.plus },       -- diff mode: Added line
    DiffChange                           = { fg = p.hint_bg },    -- diff mode: Changed line
    DiffDelete                           = { fg = p.error },      -- diff mode: Deleted line
    DiffText                             = { fg = p.warning_bg }, -- diff mode: Changed text within a changed line
    diffAdded                            = { link = 'DiffAdd' },
    diffRemoved                          = { link = 'DiffDelete' },
    diffChanged                          = { link = 'DiffChange' },

    SignAdd                              = { link = 'DiffAdd' },
    GitSignsAdd                          = { link = 'DiffAdd' },
    GitSignsAddNr                        = { link = 'DiffAdd' },
    GitSignsAddLn                        = { link = 'DiffAdd' },

    SignChange                           = { link = 'DiffChange' },
    GitSignsChange                       = { link = 'DiffChange' },
    GitSignsChangeNr                     = { link = 'DiffChange' },
    GitSignsChangeLn                     = { link = 'DiffChange' },

    SignDelete                           = { link = 'DiffDelete' },
    GitSignsDelete                       = { link = 'DiffDelete' },
    GitSignsDeleteNr                     = { link = 'DiffDelete' },
    GitSignsDeleteLn                     = { link = 'DiffDelete' },

    GitSignsAddInline                    = { link = 'DiffAdd' },
    GitSignsChangeInline                 = { link = 'DiffChange' },
    GitSignsDeleteInline                 = { link = 'DiffDelete' },

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
    DiagnosticWarning                    = { fg = p.warning_bg },
    DiagnosticInformation                = { fg = p.info_bg },
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
    -- BufferLineSeparator = 'bg_alt bg_alt',
    -- BufferLineSeparatorSelected = 'bg_alt bg',
    -- BufferLineBufferSelected = 'yellow - b',

    -- IndentBlankline -- Version 2
    IndentBlanklineChar                  = { fg = p.surface2 },
    IndentBlanklineContextChar           = { fg = p.gold },
    -- IndentBlanklineContextStart = '- - u',
    -- IndentBlanklineSpaceChar = 'cyan',
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
    WarningMsg                           = { fg = p.warning_bg },
  }

  -- apply userconfig
  groups.Comment  = vim.tbl_extend("keep", groups.Comment, config.options.styles.comments)
  groups.Function = vim.tbl_extend("keep", groups.Function, config.options.styles.functions)
  groups.Keyword  = vim.tbl_extend("keep", groups.Keyword, config.options.styles.keywords)
  groups.Type     = vim.tbl_extend("keep", groups.Type, config.options.styles.types)

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
