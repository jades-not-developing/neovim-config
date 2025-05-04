----------------------------------
--- Jade's NeoVim config file  ---
---          v0.0.1            ---
----------------------------------

-- Basic Settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.8',
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
local opts = {}
require("lazy").setup(plugins, opts)

--- @=====================@
---  Plugins Configuration 
--- @=====================@

-- Setup Catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Setup Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', "<leader>f", builtin.find_files, {  desc = "Telescope find files"})
vim.keymap.set('n', "<leader>fs", builtin.live_grep, {  desc = "Telescope find files"})

-- Setup Treesitter
local ts_config = require("nvim-treesitter.configs")
ts_config.setup({
    ensure_installed = {"lua", "rust", "typescript", "javascript"},
    highlight = { enable = true },
    indent = { enable = true },
})
