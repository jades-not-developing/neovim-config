vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.cursorline = true

vim.keymap.set('n', "<leader>h", ":noh<CR>", {})

vim.cmd("command HexView :%!xxd<CR>")

vim.filetype.add({
  extension = {
    c3 = "c3"
  }
})
