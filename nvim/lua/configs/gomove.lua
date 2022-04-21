local config = function()
    require('gomove').setup {}
    vim.cmd([[
                nmap <S-h> <Plug>GoNSMLeft
                nmap <S-j> <Plug>GoNSMDown
                nmap <S-k> <Plug>GoNSMUp
                nmap <S-l> <Plug>GoNSMRight

                xmap <S-h> <Plug>GoVSMLeft
                xmap <S-j> <Plug>GoVSMDown
                xmap <S-k> <Plug>GoVSMUp
                xmap <S-l> <Plug>GoVSMRight

                nmap <C-h> <Plug>GoNSDLeft
                nmap <C-j> <Plug>GoNSDDown
                nmap <C-k> <Plug>GoNSDUp
                nmap <C-l> <Plug>GoNSDRight

                xmap <C-h> <Plug>GoVSDLeft
                xmap <C-j> <Plug>GoVSDDown
                xmap <C-k> <Plug>GoVSDUp
                xmap <C-l> <Plug>GoVSDRight
            ]])
end

return config
