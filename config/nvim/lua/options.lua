local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  shell = "zsh",
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  background = "dark",
  clipboard = "unnamed,unnamedplus",
  swapfile = false,
  backup = false,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
