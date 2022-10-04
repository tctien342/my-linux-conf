local rust_opts = function(opts)
  local output = {}
  output.tools = {
    autoSetHints = true,
    hover_with_actions = false,
    runnables = { use_telescope = true },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = '',
      other_hints_prefix = ''
    }
  }
  output.server = {
    capabilities = opts.capabilities,
    on_attach = opts.on_attach,
    settings = {
      ['rust-analyzer'] = {
        assist = { importMergeBehavior = 'last', importPrefix = 'by_self' },
        diagnostics = { disabled = { 'unresolved-import' } },
        cargo = { loadOutDirsFromCheck = true },
        procMacro = { enable = true },
        checkOnSave = { command = 'clippy' }
      }
    }
  }
  return output
end

return rust_opts
