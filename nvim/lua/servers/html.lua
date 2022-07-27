local html_opts = function(opts)
    opts.filetypes = {'html'}
    opts.init_options = {
        configurationSection = {'html', 'css', 'javascript'},
        embeddedLanguages = {css = true, javascript = true},
        provideFormatter = true
    }
    opts.settings = {
            format = {templating = true, wrapLineLength = 120, wrapAttributes = 'auto'},
            hover = {documentation = true, references = true}
    }
end

return html_opts
