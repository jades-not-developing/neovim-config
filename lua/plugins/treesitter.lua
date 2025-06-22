return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts_config = require("nvim-treesitter.configs")
    --local ts_parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    ts_config.setup({
      ensure_installed = { "lua", "zig", "rust", "typescript", "javascript", "asm" },
      highlight = { enable = true },
      indent = { enable = true },
    })

   --ts_parser_config.c3 = {
   --  install_info = {
   --    url = "https://github.com/c3lang/tree-sitter-c3",
   --    files = { "src/parser.c", "src/scanner.c" },
   --    branch = "main",
   --    generate_requires_npm = false,
   --    requires_generate_from_grammar = true,
   --  },
   --}
  end
}
