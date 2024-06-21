--
-- LSP configuration
--

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").cssls.setup({
  capabilities = capabilities,
})

require("lspconfig").eslint.setup({
  capabilities = capabilities,
})

require("lspconfig").gleam.setup({
  capabilities = capabilities,
})

require("lspconfig").gopls.setup({
  capabilities = capabilities,
})

require("lspconfig").html.setup({
  capabilities = capabilities,
})

require("lspconfig").jsonls.setup({
  capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
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

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
})

require("lspconfig").zls.setup({
  capabilities = capabilities,
})

local function create_lsp_keymaps(args)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    create_lsp_keymaps(args)
  end,
})
