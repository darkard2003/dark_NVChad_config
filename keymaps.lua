local M = {}

M.customs = {
  i = {
    ["jk"] = { "<esc>", "Escape to normal" },
  },
  n = {
    ["<leader>pr"] = { ":Telescope projects<cr>", "Recent projects" },
    ["<leader>tr"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
}


return M
