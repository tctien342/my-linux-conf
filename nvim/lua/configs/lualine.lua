local config = function()
  local gps = require('nvim-gps')
  require('lualine').setup {
    options = { fmt = string.lower, section_separators = { left = '', right = '' } },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str)
            return str:sub(1, 1)
          end
        }
      },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'filename',
          fmt = function(str)
            local output = str
            if (gps.is_available()) then
              local location = gps.get_location()
              if (location == '') then
              else
                output = output .. ' > ' .. location
              end
            end

            local sig = require('lsp_signature').status_line(64)
            if (sig.hint == '') then
            else
              output = output .. ' > ' .. sig.hint
            end

            return output
          end
        }
      }
    }
  }
end

return config
