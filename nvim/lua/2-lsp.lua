-- This file contain setup for lsp servers
local lsp_installer = require 'mason'
local mason_bridge = require 'mason-lspconfig'

local lspconfig = require 'lspconfig'

-- Language server configuration
local javascript_opts = require 'servers.javascript'
local html_opts = require 'servers.html'
local efm_opts = require 'servers.efm'
local eslint_opts = require 'servers.eslint'
local lua_opts = require 'servers.lua'
local rust_opts = require 'servers.rust'
local tailwindcss_opts = require 'servers.tailwindcss'

-- Config supported servers
local servers = {
  'bashls', 'pyright', 'clangd', 'yamlls', 'cssls', 'tsserver', 'eslint', 'jsonls', 'sumneko_lua',
  'efm', 'vimls', 'cssmodules_ls', 'dockerls', 'dotls', 'html', 'jsonls', 'tailwindcss',
  'cssmodules_ls', 'rust_analyzer'
}

-- Pre-setup
lsp_installer.setup {}
mason_bridge.setup {
  ensure_installed = servers
}

-- Default attach for all server
local attach_default = function(client, bufnr)
end

-- Specific server configuration
local enhance_server_opts = {
  ['tsserver'] = javascript_opts,
  ['eslint'] = eslint_opts,
  ['efm'] = efm_opts,
  ['html'] = html_opts,
  ['sumneko_lua'] = lua_opts,
  ['emmet_ls'] = function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    opts.filetypes = { 'html', 'css', 'typescriptreact', 'javascriptreact' }
  end,
  ['tailwindcss'] = tailwindcss_opts
}

-- Bind into LSP
for _, server in ipairs(servers) do
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
    .make_client_capabilities())
  -- Specify the default options which we'll use to setup all servers
  local opts = { capabilities = capabilities, on_attach = attach_default }
  if enhance_server_opts[server] then
    -- Enhance the default opts with the server-specific ones
    enhance_server_opts[server](opts)
  end
  if server == 'rust_analyzer' then
    require('rust-tools').setup(rust_opts(opts))
  else
    lspconfig[server].setup(opts)
  end
end


-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
--   signs = true,
--   update_in_insert = true,
--   underline = true
-- })
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
  border = 'single'
})
