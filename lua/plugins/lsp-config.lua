return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "zls",
                    "rust_analyzer",
                    "clangd",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, "<leader>a", vim.lsp.buf.code_action, {})

            local bin_path = vim.fn.expand("~/.local/share/nvim/mason/bin/")
            if vim.fn.has('win32') then
                bin_path = vim.fn.expand("~/AppData/Local/nvim-data/mason/bin/")
            end

            lspconfig.lua_ls.setup({
                cmd = { bin_path .. "lua-language-server" },
                root_dir = function(_)
                    return vim.loop.cwd()
                end
            })
            lspconfig.zls.setup({
                cmd = { bin_path .. "zls" },
                root_dir = function(_)
                    return vim.loop.cwd()
                end
            })
            lspconfig.clangd.setup({
                cmd = { bin_path .. "clangd" },
                root_dir = function(_)
                    return vim.loop.cwd()
                end
            })
            lspconfig.rust_analyzer.setup({
                cmd = { bin_path .. "rust_analyzer" },
                root_dir = function(_)
                    return vim.loop.cwd()
                end
            })
        end
    }
}
