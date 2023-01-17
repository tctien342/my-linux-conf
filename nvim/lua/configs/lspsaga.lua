local config = function()
  require('lspsaga').setup {
    ui = {
      border = 'single',
      colors = {
        --float window normal background color
        normal_bg = 'NONE',
      }
    }
  }
end

return config
