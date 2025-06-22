return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "svelte",
          "lua_ls",
          "ts_ls",
          "zls",
          "rust_analyzer",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      local util = lspconfig.util;

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, {})

      local bin_path = vim.fn.expand("~/.local/share/nvim/mason/bin/")
      if vim.fn.has("win32") then
        bin_path = vim.fn.expand("~/AppData/Local/nvim-data/mason/bin/")
      end

      lspconfig.svelte.setup({
        capabilities = capabilities,
        root_dir = function(_)
          return vim.loop.cwd()
        end
      })
      lspconfig.c3_lsp.setup({
        capabilities = capabilities,
        root_dir = function(_)
          return vim.loop.cwd()
        end
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        root_dir = function(_)
          return vim.loop.cwd()
        end
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        cmd = { bin_path .. "lua-language-server" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
      })
      lspconfig.zls.setup({
        capabilities = capabilities,
        cmd = { bin_path .. "zls" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { bin_path .. "clangd" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        cmd = { bin_path .. "rust-analyzer" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
      })
    end,
  },
}
