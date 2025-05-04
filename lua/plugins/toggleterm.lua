return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup()

        vim.keymap.set({ 'n', 't' }, "<C-\\>", "<CMD>ToggleTerm direction=float<CR>", {})
    end
}
