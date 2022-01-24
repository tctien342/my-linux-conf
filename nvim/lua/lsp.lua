-- local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local coq = require "coq"
-- local cmp = require'cmp'
local null_ls = require("null-ls")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d, -- eslint or eslint_d
        null_ls.builtins.code_actions.eslint_d, -- eslint or eslint_d
        null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
    },
})

-- cmp.setup({
--     snippet = {
--       -- REQUIRED - you must specify a snippet engine
--       expand = function(args)
--         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--       end,
--     },
--     mapping = {
--       ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     },
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       { name = 'luasnip' }, -- For luasnip users.
--       { name = 'path' },
--     },{
--         { name = 'buffer' },
--       })
-- })

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_key = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      },
      auto_close_after = 3,
      transparency = 80,
      timer_interval = 100
    }, bufnr)
    local opts_lsp = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts_lsp)
end

lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    init_options = require("nvim-lsp-ts-utils").init_options,
    --
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
           import_all_scan_buffers = 100,
           import_all_select_source = false,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        default_key(client, bufnr)
    end,
}))

-- FOR CSS AND SCSS
local cssCap = vim.lsp.protocol.make_client_capabilities()
cssCap.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup(coq.lsp_ensure_capabilities({
  capabilities = cssCap,
  on_attach = function(client, bufnr)
    default_key(client, bufnr)
  end
}))
lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
  on_attach = function(client, bufnr)
    default_key(client, bufnr)
  end
}))

-- FOR LUA
lspconfig.efm.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = false},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            }
        }
    }
}))

-- FOR VIM
lspconfig.vimls.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = true},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
}))
-- FOR BASH SCRIPT
lspconfig.bashls.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = true},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
}))

