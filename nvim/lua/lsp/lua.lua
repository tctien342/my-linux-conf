local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        default_key(client, bufnr)
    end
}))

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "json"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            },
            json = {
                {
                    formatCommand = "prettier_d_slim --stdin-filepath ${INPUT}",
                    formatStdin = true
                }
            }
        }
    }
}
