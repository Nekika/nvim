--
-- LSP configuration
--

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").cssls.setup({
  capabilities = capabilities,
})

require("lspconfig").elixirls.setup({
  capabilities = capabilities,
  cmd = { "/usr/local/lib/elixir-ls/language_server.sh" }
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

require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
})

require("lspconfig").zls.setup({
  capabilities = capabilities,
})

local function create_lsp_autocmds(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if client ~= nil and client.name == "gopls" then
    vim.api.nvim_create_autocmd("BufWrite", {
      callback = function(_)
        vim.lsp.buf.format()
      end
    })
  end
end

local function create_lsp_keymaps(args)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    create_lsp_autocmds(args)
    create_lsp_keymaps(args)
  end,
})
