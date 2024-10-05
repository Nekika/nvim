local configs = {
  { name = "cssls" },
  { name = "dockerls" },
  {
    name = "elixirls",
    options = {
      cmd = { "/usr/local/lib/elixir-ls/language-server.sh" }
    }
  },
  { name = "gleam" },
  { name = "gopls" },
  { name = "html" },
  { name = "jsonls" },
  {
    name = "lua_ls",
    options = {
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
    }
  },
  { name = "ruby_lsp" },
  { name = "svelte" },
  { name = "ts_ls" },
}

local function setup(config)
  config.options = config.options or {}
  require("lspconfig")[config.name].setup(config.options)
end

for _, config in ipairs(configs) do
  setup(config)
end
