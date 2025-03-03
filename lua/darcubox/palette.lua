local M = {}

-- stylua: ignore
M.palette = {
  -- UI
  contrast   = "#0A0D0F",
  bg         = "#0E1214",
  surface1   = "#25262C",
  surface2   = "#404146",
  fg         = "#D0C6A5",

  -- Syntax
  black      = "#16181C",
  sunshine   = "#FFD072",
  gold       = "#FB982E",
  ember      = "#DD4E21",
  sand       = "#E6A96B",
  meadow     = "#52A260",
  lime       = "#9CD750",
  sapphire   = "#0F829D",
  crimson    = "#D01C26",
  lilac      = "#CD80B9",
  silver     = "#8F8682",
  alabaster  = "#EFEAD9",

  -- diff, git and diagnostic colors
  error      = "#EB5F6A", -- default: #EB5F6A
  warning    = "#FF9B0A",
  plus       = "#5A9F81", -- default: #5A9F81
  info       = "#878080",
  hint       = "#287BDE",
  error_bg   = "#9E2927", -- default: #4D2D2C
  warning_bg = "#42321B", -- default: #42321B
  plus_bg    = "#32593D",
  info_bg    = "#484040", -- default: #484040
  hint_bg    = "#263C50", -- default: #263C50
}

-- Darcula colors:
------------------

-- #2B2B2B #A9B7C6 #BBBBBB #344134 #40332B #313335 #214283
-- #323232 #A4A3A3 #CC666E #BC3F3C #A9B7C6 #606060 #287BDE
-- #BBBBBB #606366 #FFEF28 #3B514D #A8C023 #32593D #8C8C8C
-- #3A3A3A #9876AA #CC7832 #808080 #629755 #6A8759 #6897BB
-- #CC7832 #8A653B #FFC66D #294436 #385570 #484A4A #303C47
-- #384C38 #4C4638 #374752 #656E76 #659C6B #BBB529 #908B25
-- #B5B6E3 #9373A5 #666D75 #532B2E #52503A #9E2927 #BE9117
-- #756D56 #B9BCD1 #46484A #BBBBBB #113A5C #616263 #E8BF6A
-- #6D9CBE #BABABA #A5C261 #507874 #3C3F41 #BBBBBB #787878
-- #4E5254 #C57633 #232525 #4EADE5 #20999D #5E5339 #3B3B3B
-- #787878 #2F2F2F #3592C4 #499C54 #C75450 #93896C

-- Gruvbox colors:
------------------

-- #282828 #CC241D #98971A #D79921 #458588 #B16286 #689D6A
-- #A89984 #928374 #FB4934 #B8BB26 #FABD2F #83A598 #D3869B
-- #8EC07C #EBDBB2 #1D2021 #504945 #7c6f64 #928374 #D65D0E
-- #32302F #BDAE93 #D5C4A1 #FBF1C7 #FE8019

return M
