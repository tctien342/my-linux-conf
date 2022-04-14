-- This file contain setup for lsp servers
local lsp_installer = require 'nvim-lsp-installer'
local init_checker = false

-- Language server configuration
local javascript_opts = require 'servers.javascript'
local efm_opts = require 'servers.efm'
local eslint_opts = require 'servers.eslint'
local lua_opts = require 'servers.lua'
local tailwindcss_opts = require 'servers.tailwindcss'

local utils = require 'configs.utils'
-- For mapping keys
local map = utils.map

local servers = {
    'bashls', 'pyright', 'clangd', 'yamlls', 'cssls', 'tsserver', 'eslint', 'jsonls', 'sumneko_lua',
    'efm', 'rust_analyzer', 'vimls', 'emmet_ls', 'cssmodules_ls', 'dockerls', 'dotls', 'html',
    'jsonls', 'tailwindcss', 'cssmodules_ls'
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        init_checker = true
        server:install()
    end
end
if init_checker then
    -- Show installer if not install any of LSP
    require'nvim-lsp-installer'.info_window.open()
end

local attach_default = function(client, bufnr)
    require'illuminate'.on_attach(client)
end

local enhance_server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ['tsserver'] = javascript_opts,
    ['eslint'] = eslint_opts,
    ['efm'] = efm_opts,
    ['sumneko_lua'] = lua_opts,
    ['emmet_ls'] = function(opts)
        opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
        opts.filetypes = {'html', 'css', 'typescriptreact', 'javascriptreact'}
    end,
    ['tailwindcss'] = tailwindcss_opts
}

lsp_installer.on_server_ready(function(server)
    map('n', 'gs', '<cmd>w<cr>')
    -- Go defination
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- Call LSP hover -- Go detail
    map('n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- Call code action with telescope --  Go action
    map('n', 'ga', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
    -- Rename using LSP -- Go rename
    map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- Format using LSP -- Go format
    map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
    -- Jump into other instance -- Go Jump
    map('n', 'gj', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
    -- Diagnostic details
    map('n', '``',
        '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<cr>')

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                         .make_client_capabilities())
    -- Specify the default options which we'll use to setup all servers
    local opts = {
        capabilities = capabilities,
        on_attach = attach_default
        -- root_dir = function()
        --     return '.'
        -- end
    }

    if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)

local lsp = vim.lsp
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true
})

lsp.handlers['textDocument/hover'] = lsp.with(vim.lsp.handlers.hover, {border = 'single'})
lsp.handlers['textDocument/signatureHelp'] = lsp.with(vim.lsp.handlers.signature_help,
                                                      {border = 'single'})
