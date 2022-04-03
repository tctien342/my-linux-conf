local utils = require("utils")
-- Default format JS will be eslint, if not have config yet -> fallback into Prettier
vim.cmd [[
    command! FormatJS EslintFixAll"
]]

local eslint_opts = function(opts)
    local default_attach = opts.on_attach

    opts.settings = {
        format = {enable = true},
        codeActionOnSave = {enable = true, mode = "all"},
        run = "onType"
    }
    opts.init_options = {documentFormatting = true}
    opts.handlers = {
        ["eslint/noLibrary"] = function()
            vim.cmd [[
                command! FormatJS PrettierAsync"
            ]]
            return 0
        end,
        ["eslint/noConfig"] = function()
            vim.cmd [[
                command! FormatJS PrettierAsync"
            ]]
            return 0
        end
    }
    opts.on_attach = function(client, buf)
        default_attach(client, buf)
        utils.map('n', 'gf', '<cmd>PrettierAsync<cr>')
    end

end

return eslint_opts
