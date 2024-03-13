require("lspconfig").gleam.setup({})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "require",
          "vim",
        }
      }
    }
  }
})