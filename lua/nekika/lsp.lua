--
-- LSP configuration
--

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

require("lspconfig").rust_analyzer.setup({})

require("lspconfig").svelte.setup({})

require("lspconfig").ts_ls.setup({})

require("lspconfig").zls.setup({})

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
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    create_lsp_autocmds(args)
    create_lsp_keymaps(args)
  end,
})
