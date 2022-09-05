-- This file content setup for code completion
local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('luasnip.loaders.from_vscode').lazy_load({paths = {'./snippets'}})

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
               and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$')
               == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    formatting = {
        fields = {'kind', 'abbr', 'menu'},
        format = function(entry_stock, vim_item_stock)
            local kind
            if entry_stock.source.name == 'copilot' then
                vim_item_stock.kind = ' Copilot'
                vim_item_stock.kind_hl_group = 'CmpItemKindCopilot'
                kind = vim_item_stock
            else
                kind = lspkind.cmp_format({
                    mode = 'symbol_text', -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            copilot = '[AIC]',
                            nvim_lsp = '[LSP]',
                            emoji = '[EMO]',
                            path = '[PTH]',
                            calc = '[CAL]',
                            luasnip = '[SNI]',
                            buffer = '[BUF]',
                            spell = '[SPE]',
                            nvim_lua = '[NVI]',
                            tmux = '[MUX]'
                        })[entry.source.name]
                        return vim_item
                    end
                })(entry_stock, vim_item_stock)
            end

            local strings = vim.split(kind.kind, '%s', {trimempty = true})
            kind.kind = ' ' .. strings[1] .. ' '
            kind.menu = '    (' .. strings[2] .. ')'
            return kind
        end
    },
    window = {
        completion = { -- rounded border; thin-style scrollbar
            winhighlight = 'Normal:Pmenu,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None',
            border = 'single',
            scrollbar = '║',
            col_offset = -3,
            side_padding = 0
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
    sorting = {
        priority_weight = 2,
        comparators = {
            -- require('copilot_cmp.comparators').prioritize, require('copilot_cmp.comparators').score,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact, cmp.config.compare.score, cmp.config.compare.recently_used,
            cmp.config.compare.locality, cmp.config.compare.kind, cmp.config.compare.sort_text,
            cmp.config.compare.length, cmp.config.compare.order
        }
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
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
        -- {name = 'copilot', priority = 5},
        {name = 'nvim_lsp', priority = 6}, {name = 'luasnip', priority = 3},
        {name = 'buffer', priority = 4}, {name = 'path', priority = 3},
        {name = 'nvim_lua', priority = 3}, {name = 'spell', priority = 3},
        {name = 'tmux', priority = 2, option = {all_panes = true}}
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score,
            require'cmp-under-comparator'.under, cmp.config.compare.kind,
            cmp.config.compare.sort_text, cmp.config.compare.length, cmp.config.compare.order
        }
    }
})

-- Config complete for vim cmd
cmp.setup.cmdline(':', {mapping = cmp.mapping.preset.cmdline(), sources = {{name = 'cmdline'}}})
cmp.setup.cmdline('/', {mapping = cmp.mapping.preset.cmdline(), sources = {{name = 'buffer'}}})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it. 
    }, {{name = 'buffer'}})
})

-- For autopairs
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Config highlights
local highlight = {
    PmenuSel = {bg = '#282C34', fg = 'NONE'},
    Pmenu = {fg = '#C5CDD9', bg = '#22252A'},

    CmpItemAbbrDeprecated = {fg = '#7E8294', bg = 'NONE', strikethrough = true},
    CmpItemAbbrMatch = {fg = '#82AAFF', bg = 'NONE', bold = true},
    CmpItemAbbrMatchFuzzy = {fg = '#82AAFF', bg = 'NONE', bold = true},
    CmpItemMenu = {fg = '#C792EA', bg = 'NONE', italic = true},

    CmpItemKindField = {fg = '#EED8DA', bg = '#B5585F'},
    CmpItemKindProperty = {fg = '#EED8DA', bg = '#B5585F'},
    CmpItemKindEvent = {fg = '#EED8DA', bg = '#B5585F'},

    CmpItemKindText = {fg = '#C3E88D', bg = '#9FBD73'},
    CmpItemKindEnum = {fg = '#C3E88D', bg = '#9FBD73'},
    CmpItemKindKeyword = {fg = '#C3E88D', bg = '#9FBD73'},

    CmpItemKindConstant = {fg = '#FFE082', bg = '#D4BB6C'},
    CmpItemKindConstructor = {fg = '#FFE082', bg = '#D4BB6C'},
    CmpItemKindReference = {fg = '#FFE082', bg = '#D4BB6C'},

    CmpItemKindFunction = {fg = '#EADFF0', bg = '#A377BF'},
    CmpItemKindStruct = {fg = '#EADFF0', bg = '#A377BF'},
    CmpItemKindClass = {fg = '#EADFF0', bg = '#A377BF'},
    CmpItemKindModule = {fg = '#EADFF0', bg = '#A377BF'},
    CmpItemKindOperator = {fg = '#EADFF0', bg = '#A377BF'},

    CmpItemKindVariable = {fg = '#C5CDD9', bg = '#7E8294'},
    CmpItemKindFile = {fg = '#C5CDD9', bg = '#7E8294'},

    CmpItemKindUnit = {fg = '#F5EBD9', bg = '#D4A959'},
    CmpItemKindSnippet = {fg = '#F5EBD9', bg = '#D4A959'},
    CmpItemKindFolder = {fg = '#F5EBD9', bg = '#D4A959'},

    CmpItemKindMethod = {fg = '#DDE5F5', bg = '#6C8ED4'},
    CmpItemKindValue = {fg = '#DDE5F5', bg = '#6C8ED4'},
    CmpItemKindEnumMember = {fg = '#DDE5F5', bg = '#6C8ED4'},

    CmpItemKindInterface = {fg = '#D8EEEB', bg = '#58B5A8'},
    CmpItemKindColor = {fg = '#D8EEEB', bg = '#58B5A8'},
    CmpItemKindTypeParameter = {fg = '#D8EEEB', bg = '#58B5A8'}
}
for k, v in pairs(highlight) do vim.api.nvim_set_hl(0, k, v) end

-- Codepilot color
vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', {fg = '#6CC644'})
