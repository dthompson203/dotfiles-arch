-- Set the path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If it's not installed, clone it automatically
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy and your plugin list (inputting "plugins" here will direct lazy to look in /nvim/plugins/plugins.lua)
require("lazy").setup("plugins")

