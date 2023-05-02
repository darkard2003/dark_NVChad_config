local options = {
  relativenumber = true,
  foldmethod = "indent",
  foldlevel = 99,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
