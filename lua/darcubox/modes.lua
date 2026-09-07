local M = {}

function M.setup()
  local p = require("darcubox.palette").palette
  local options = require("darcubox").config.options.mode_highlights

  if not options.enabled then
    return
  end

  local modes = {
    n = vim.tbl_extend("keep", { cursor = p.gold, line = p.surface1, linenr = p.alabaster }, options.normal),
    i = vim.tbl_extend("keep", { cursor = p.plus, line = p.plus_bg, linenr = p.plus }, options.insert),
    R = vim.tbl_extend("keep", { cursor = p.warning, line = p.warning_bg, linenr = p.warning }, options.replace),
    v = vim.tbl_extend("keep", { cursor = p.hint, line = p.hint_bg, linenr = p.hint }, options.visual),
  }

  local group = vim.api.nvim_create_augroup("DarcuboxModeHighlights", { clear = true })

  local function apply()
    local mode = vim.fn.mode()
    local visual = mode == "v" or mode == "V" or mode == "\22"
    local colors = visual and modes.v or modes[mode] or modes.n

    vim.api.nvim_set_hl(0, "Cursor", { fg = colors.cursor, reverse = true })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.line })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.linenr })
    vim.api.nvim_set_hl(0, "Visual", visual and { bg = colors.line } or {})
  end

  vim.api.nvim_create_autocmd("ModeChanged", {
    group = group,
    callback = apply,
  })

  apply()
end

return M
