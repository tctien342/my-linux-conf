local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")
local TSPrebuild = {}

TSPrebuild.on_attach = function(client, bufnr)
    if has_prebuilt then return end

    local query = require("vim.treesitter.query")

    local function safe_read(filename, read_quantifier)
        local file, err = io.open(filename, "r")
        if not file then error(err) end
        local content = file:read(read_quantifier)
        io.close(file)
        return content
    end

    local function read_query_files(filenames)
        local contents = {}

        for _, filename in ipairs(filenames) do table.insert(contents, safe_read(filename, "*a")) end

        return table.concat(contents, "")
    end

    local function prebuild_query(lang, query_name)
        local query_files = query.get_query_files(lang, query_name)
        local query_string = read_query_files(query_files)

        query.set_query(lang, query_name, query_string)
    end

    local prebuild_languages = {"typescript", "javascript", "tsx"}
    for _, lang in ipairs(prebuild_languages) do
        prebuild_query(lang, "highlights")
        prebuild_query(lang, "injections")
    end

    has_prebuilt = true
end

lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, bufnr)
        TSPrebuild.on_attach(client, bufnr)
        if client.config.flags then client.config.flags.allow_incremental_sync = true end
        client.resolved_capabilities.document_formatting = true
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> EslintFixAll
          augroup END
          ]])
        end
        -- no default maps, so you may want to define some here
        local opts = {silent = true}
        default_key(client, bufnr)
    end
}))

lspconfig.eslint.setup(coq.lsp_ensure_capabilities({
    cmd = {"vscode-eslint-language-server", "--stdio"},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue"},
    init_options = {documentFormatting = true},
    settings = {
        codeAction = {disableRuleComment = {enable = true, location = "separateLine"}, showDocumentation = {enable = true}},
        codeActionOnSave = {enable = true, mode = "all"},
        format = true,
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {mode = "location"}
    }
}))
