-- This file contain setup for lsp servers
local lsp_installer = require "nvim-lsp-installer"

-- Language server configuration
local javascript_opts = require "servers.javascript"
local efm_opts = require "servers.efm"
local eslint_opts = require "servers.eslint"
local lua_opts = require "servers.lua"

local utils = require "utils"
-- For mapping keys
local map = utils.map

local servers = {
    "bashls", "pyright", "clangd", "yamlls", "cssls", "tsserver", "eslint",
    "jsonls", "sumneko_lua", "efm", "rust_analyzer", "solidity_ls", "vimls",
    'emmet_ls'
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing LSP:" .. name)
        server:install()
    end
end

local attach_default = function(client, bufnr)
    require"lsp_signature".on_attach({
        auto_close_after = 3,
        timer_interval = 100
    }, bufnr)
end

local enhance_server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["tsserver"] = javascript_opts,
    ["eslint"] = eslint_opts,
    ["efm"] = efm_opts,
    ["sumneko_lua"] = lua_opts,
    ["emmet_ls"] = function(opts)
        opts.capabilities.textDocument.completion.completionItem.snippetSupport =
            true
        opts.filetypes = {"html", "css", "typescriptreact", "javascriptreact"}
    end
}

lsp_installer.on_server_ready(function(server)
    map('n', 'gs', '<cmd>w<cr>')
    -- Go defination
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- Call LSP hover -- Go detail
    map('n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- Call code action with telescope --  Go action
    map('n', 'ga',
        '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
    -- Rename using LSP -- Go rename
    map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- Format using LSP -- Go format 
    map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
    -- Jump into other instance -- Go Jump
    map('n', 'gj', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                         .protocol
                                                                         .make_client_capabilities())
    -- Specify the default options which we'll use to setup all servers
    local opts = {
        capabilities = capabilities,
        on_attach = attach_default,
        root_dir = function() return "." end
    }

    if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)
