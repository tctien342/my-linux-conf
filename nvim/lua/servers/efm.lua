local efm_opts = function(opts)
    opts.init_options = {documentFormatting = true}
    opts.filetypes = {'lua', 'json', 'python'}
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
            },
            -- Python need: black, isort, flake8, mypy
            python = {
                {formatCommand = 'black --fast -', formatStdin = true},
                {formatCommand = 'isort --stdout --profile black -', formatStdin = true}, {
                    lintCommand = 'flake8 --max-line-length 160 --format \'%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s\' --stdin-display-name ${INPUT} -',
                    lintStdin = true,
                    lintIgnoreExitCode = true,
                    lintFormats = {'%f:%l:%c: %t%n%n%n %m'},
                    lintSource = 'flake8'
                }, {
                    lintCommand = 'mypy --show-column-numbers --ignore-missing-imports --show-error-codes',
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'
                    },
                    lintSource = 'mypy'
                }
            }
        }
    }
end

return efm_opts
