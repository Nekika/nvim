require("lspconfig").cssls.setup({})

require("lspconfig").dockerls.setup({})

require("lspconfig").elixirls.setup({
  cmd = { "/usr/local/lib/elixir-ls/language_server.sh" }
})

require("lspconfig").eslint.setup({})

require("lspconfig").gleam.setup({})

require("lspconfig").gopls.setup({})

require("lspconfig").html.setup({})

require("lspconfig").jsonls.setup({})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    }
  }
})

require("lspconfig").svelte.setup({})

require("lspconfig").ts_ls.setup({})
