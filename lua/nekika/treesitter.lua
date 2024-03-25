require("nvim-treesitter.configs").setup({
  ensure_installed = { "gleam", "go", "lua", "vim", "zig" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true
  }
})
