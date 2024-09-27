local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', { clear = true })

local function setup_autoformat(event)
  local id = vim.tbl_get(event, 'data', 'client_id')
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil then
    return
  end

  vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = event.buf })

  local buf_format = function(e)
    vim.lsp.buf.format({
      bufnr = e.buf,
      async = false,
      timeout_ms = 10000,
    })
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = event.buf,
    group = fmt_group,
    desc = 'Format current buffer',
    callback = buf_format,
  })
end

local function setup_keymaps(event)
  local keymap = function(mode, lhs, rhs)
    local opts = { buffer = event.buf }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Trigger completion
  keymap('i', '<C-CR>', '<C-x><C-o>')

  -- Display documentation
  keymap('n', 'K', vim.lsp.buf.hover)

  -- Go to the definition
  keymap('n', 'gd', vim.lsp.buf.definition)

  -- Go to declaration
  keymap('n', 'gD', vim.lsp.buf.declaration)

  -- Lists implementations
  keymap('n', 'gi', vim.lsp.buf.implementation)

  -- Lists references
  keymap('n', 'gr', vim.lsp.buf.references)

  -- Go to type definition
  keymap('n', 'gt', vim.lsp.buf.type_definition)

  -- Renames all references
  keymap('n', '<F6>', vim.lsp.buf.rename)

  -- List code actions
  keymap({ 'i', 'n' }, '<F2>', vim.lsp.buf.code_action)
end

local function on_attach(event)
  setup_autoformat(event)
  setup_keymaps(event)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = on_attach
})
