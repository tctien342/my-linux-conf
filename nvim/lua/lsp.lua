local lspconfig = require("lspconfig")
local coq = require "coq"
local TSPrebuild = {}
local has_prebuilt = false
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

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

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  floating_window = true,
  handler_opts = {
    border = "rounded"
  }
})

local default_key = function(client, bufnr)
    require "lsp_signature".on_attach({
      auto_close_after = 3,
      transparency = 80,
      timer_interval = 100
    }, bufnr)
    local opts_lsp = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'ga', '<cmd>CodeActionMenu<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts_lsp)
end

lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    --
    on_attach = function(client, bufnr)
        TSPrebuild.on_attach(client, bufnr)
        if client.config.flags then
          client.config.flags.allow_incremental_sync = true
         end        
        client.resolved_capabilities.document_formatting = false
        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        default_key(client, bufnr)
    end,
}))

-- FOR CSS AND SCSS
local cssCap = vim.lsp.protocol.make_client_capabilities()
cssCap.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup(coq.lsp_ensure_capabilities({
  capabilities = cssCap,
  on_attach = function(client, bufnr)
    default_key(client, bufnr)
  end
}))
lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
  on_attach = function(client, bufnr)
    default_key(client, bufnr)
  end
}))

-- FOR LUA
lspconfig.efm.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = true, goto_definition = false},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            },
            javascript = {eslint},
            javascriptreact = {eslint}, 
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},      
            ["typescript.tsx"] = {eslint},
            typescriptreact = {eslint}  
        }
    },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescript.tsx",
      "typescriptreact"
    },
}))

-- FOR VIM
lspconfig.vimls.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = true},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
}))
-- FOR BASH SCRIPT
lspconfig.bashls.setup(coq.lsp_ensure_capabilities({
    init_options = {documentFormatting = true},
    on_attach = function(client, bufnr)
      default_key(client, bufnr)
    end,
}))

