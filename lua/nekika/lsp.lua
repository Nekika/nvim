--
-- LSP configuration
--
require("lspconfig").gleam.setup({})

require("lspconfig").gopls.setup({})

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

require("lspconfig").zls.setup({})

local function create_lsp_keymaps(args)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    create_lsp_keymaps(args)
  end,
})
