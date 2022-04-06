local efm_opts = function(opts)
    opts.init_options = {documentFormatting = true}
    opts.filetypes = {'lua', 'json'}
    opts.settings = {
        rootMarkers = {'.git/'},
        languages = {
            lua = {
                {
                    formatCommand = 'lua-format -i --double-quote-to-single-quote --no-use-tab --no-keep-simple-function-one-line --no-break-after-operator --column-limit=100 --break-after-table-lb',
                    formatStdin = true
                }
            },
            json = {
                {formatCommand = 'prettier_d_slim --stdin-filepath ${INPUT}', formatStdin = true}
            }
        }
    }
end

return efm_opts
