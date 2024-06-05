require("ovsiankina") -- load my neovim configs

-- Bootstrap LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- look for lazy
if not vim.loop.fs_stat(lazypath) then -- if lazy not found, git clone lazy
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- Load all plugins in lua/plugins
