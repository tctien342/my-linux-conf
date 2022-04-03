local javascript_opts = function(opts)
    local default_attach = opts.on_attach
    opts.setting = {formatCommand = ":FormatJS"}
    opts.on_attach = function(client, buf)
        default_attach(client, buf)
        client.resolved_capabilities.document_formatting = false
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> FormatJS
            augroup END
        ]])
    end
end

return javascript_opts
