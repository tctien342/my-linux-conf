local config = function()
  local navic = require("nvim-navic")
  require('lualine').setup {
    options = { fmt = string.lower, section_separators = { left = '', right = '' }, theme = 'tokyonight' },
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
          fmt = function()
            local output = ''
            if (navic.is_available()) then
              local location = navic.get_location()
              if (location == '') then
              else
                output = '|  ' .. location
              end
            end
            return output
          end
        }
      }
    }
  }
end

return config
