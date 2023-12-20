local M = {}

local defaults = {
  options = {
    transparent = false,
    styles = {
      comments = {},
      functions = {},
      keywords = {},
      types = {},
    },
  },
  overrides = {},
}

M.config = defaults

function M.setup(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

function M.load()
  if vim.version().minor < 8 then
    vim.notify_once("darcubox.nvim: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end

  vim.g.colors_name = "darcubox"
  vim.o.termguicolors = true

  local groups = require("darcubox.groups").setup()

  -- add highlights
  for group, settings in pairs(groups) do
    -- if M.config.options.transparent then
    --     settings.bg = "NONE" -- applicate the transparent background
    -- end
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
