--@type ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  transparency = true,
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File",       "Spc f f", "Telescope find_files" },
      { "  Recent Files",    "Spc f o", "Telescope oldfiles" },
      { "  Recent Projects", "Spc p r", "Telescope projects" },
      { "  Find Word",       "Spc f w", "Telescope live_grep" },
      { "  Bookmarks",       "Spc b m", "Telescope marks" },
      { "  Themes",          "Spc t h", "Telescope themes" },
      { "  Mappings",        "Spc c h", "NvCheatsheet" },
    },
  },
  statusline = {
    theme = "vscode_colored",
  },
}
M.mappings = require "custom.keymaps"
M.plugins = "custom.plugins"
return M
