-- This file content setup for cmp completion
local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('luasnip.loaders.from_vscode').lazy_load({paths = {'./snippets'}})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
               and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
               == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    formatting = {
        format = function(entry_stock, vim_item_stock)
            if entry_stock.source.name == 'copilot' then
                vim_item_stock.kind = ' Copilot'
                vim_item_stock.kind_hl_group = 'CmpItemKindCopilot'
                return vim_item_stock
            end
            return lspkind.cmp_format({
                mode = 'symbol_text', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        copilot = '[AI]',
                        nvim_lsp = '[LSP]',
                        emoji = '[EMO]',
                        path = '[PTH]',
                        calc = '[CAL]',
                        luasnip = '[SNI]',
                        buffer = '[BUF]'
                    })[entry.source.name]
                    return vim_item
                end
            })(entry_stock, vim_item_stock)
        end
    },
    window = {
        completion = { -- rounded border; thin-style scrollbar
            border = 'single',
            scrollbar = '║'
        },
        documentation = {
            border = 'single',
            winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
            max_width = 50,
            min_width = 50,
            max_height = math.floor(vim.o.lines * 0.3),
            min_height = 3
        }
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {
        {name = 'copilot', priority = 7}, {name = 'nvim_lsp', priority = 6},
        {name = 'luasnip', priority = 3}, {name = 'buffer', priority = 4},
        {name = 'path', priority = 3}
    }
})

-- Codepilot color
vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', {fg = '#6CC644'})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it. 
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- For autopairs
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

