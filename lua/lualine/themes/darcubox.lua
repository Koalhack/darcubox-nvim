local p = require('darcubox.palette').palette
local config = require('darcubox').config

local darcubox = {}

local bg = config.options.transparent and "NONE" or p.surface1

darcubox.normal = {
  a = { bg = p.silver, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
  c = { bg = bg, fg = p.alabaster },
}
darcubox.insert = {
  a = { bg = p.lime, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
}
darcubox.terminal = {
  a = { bg = p.ember, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
}
darcubox.visual = {
  a = { bg = p.alabaster, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
}
darcubox.replace = {
  a = { bg = p.crimson, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
}
darcubox.command = {
  a = { bg = p.sunshine, fg = p.black, gui = 'bold' },
  b = { bg = p.surface2, fg = p.fg },
}
darcubox.inactive = {
  a = { bg = bg, fg = p.silver, gui = 'bold' },
  b = { bg = bg, fg = p.alabaster },
  c = { bg = bg, fg = p.alabaster },
}

return darcubox
