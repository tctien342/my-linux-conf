local config = function()
    require('lualine').setup {
        options = {fmt = string.lower},
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str)
                        return str:sub(1, 1)
                    end
                }
            },
            lualine_b = {'branch'},
            lualine_c = {
                {
                    'filename',
                    fmt = function(str)
                        local sig = require('lsp_signature').status_line(64)
                        if (sig.hint == '') then
                            return str
                        else
                            return str .. ' > ' .. sig.hint
                        end
                    end
                }
            }
        }
    }
end

return config
