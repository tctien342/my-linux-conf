CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

O = {
  format_on_save = true,
  auto_close_tree = 0,
  auto_complete = true,
  colorcolumn = "99999", -- fixes indentline for now
  colorscheme = "spacegray",
  clipboard = "unnamedplus",
  hidden_files = true,
  wrap_lines = false,
  spell = false,
  spelllang = "en",
  number = true,
  relative_number = true,
  number_width = 4,
  shift_width = 2,
  tab_stop = 2,
  cmdheight = 2,
  cursorline = true,
  shell = "fish",
  scrolloff = 0,
  timeoutlen = 100,
  nvim_tree_disable_netrw = 0,
  ignore_case = true,
  smart_case = true,
  lushmode = false,
  hl_search = false,
  document_highlight = true,
  transparent_window = true,
  leader_key = "space",
  vnsip_dir = vim.fn.stdpath "config" .. "/snippets",

  -- @usage pass a table with your desired languages
  treesitter = {
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = { enabled = true },
    -- The below are for treesitter-textobjects plugin
    textobj_prefixes = {
      goto_next = "]", -- Go to next
      goto_previous = "[", -- Go to previous
      inner = "i", -- Select inside
      outer = "a", -- Selct around
      swap = "<leader>a", -- Swap with next
    },
    textobj_suffixes = {
      -- Start and End respectively for the goto keys
      -- for other keys it only uses the first
      ["function"] = { "f", "F" },
      ["class"] = { "m", "M" },
      ["parameter"] = { "a", "A" },
      ["block"] = { "k", "K" },
      ["conditional"] = { "i", "I" },
      ["call"] = { "c", "C" },
      ["loop"] = { "l", "L" },
      ["statement"] = { "s", "S" },
      ["comment"] = { "/", "?" },
    },
    -- The below is for treesitter hint textobjects plugin
    hint_labels = { "h", "j", "f", "d", "n", "v", "s", "l", "a" },
  },

  lsp = {
    popup_border = "single",
  },

  database = { save_location = "~/.config/nvcode_db", auto_execute = 1 },

  plugin = {
    -- Builtins
    dashboard = { active = false },
    colorizer = { active = false },
    -- zen = { active = false },
    ts_playground = { active = false },
    ts_context_commentstring = { active = false },
    ts_hintobjects = { active = false },
    ts_autotag = { active = false },
    ts_rainbow = { active = false },
    ts_textobjects = { active = false },
    ts_textsubjects = { active = false },
    telescope_fzy = { active = false },
    telescope_project = { active = false },
    indent_line = { active = false },
    symbol_outline = { active = false },
    debug = { active = false },
    dap_install = { active = false },
    lush = { active = false },
    diffview = { active = false },
    floatterm = { active = false },
    trouble = { active = false },
    sanegx = { active = false },
  },

  user_which_key = {},

  user_plugins = {
    -- use lv-config.lua for this not put here
  },

  user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
  },

  lang = {
    cmake = {},
    clang = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      cross_file_rename = true,
      header_insertion = "never",
    },
    css = {
      virtual_text = true,
    },
    dart = {
      sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
    },
    docker = {},
    efm = {},
    elm = {},
    emmet = { active = true },
    elixir = {},
    graphql = {},
    go = {},
    html = {},
    java = {
      java_tools = {
        active = false,
      },
    },
    json = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    kotlin = {},
    latex = {},
    lua = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    php = {
      format = {
        format = {
          default = "psr12",
        },
      },
      environment = {
        php_version = "7.4",
      },
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "php", "phtml" },
    },
    python = {
      linter = "",
      isort = false,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true,
      },
    },
    ruby = {
      diagnostics = {
        virtualtext = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "rb", "erb", "rakefile", "ruby" },
    },
    rust = {
      rust_tools = {
        active = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>", -- prefix for all the other hints (type, chaining)
      },
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    sh = {
      -- @usage can be 'shellcheck'
      linter = "",
      -- @usage can be 'shfmt'
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    svelte = {},
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
    terraform = {},
    tsserver = {
      -- @usage can be 'eslint'
      linter = "eslint",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    vim = {},
    yaml = {},
  },

  dashboard = {

    custom_header = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣾⠿⠿⠟⠛⠛⠛⠛⠿⠿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⡿⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠒⠂⠉⠉⠉⠉⢩⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⢰⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠠⡀⠀⠀⢀⣾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡧⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠈⠁⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠉⠢⠤⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡟⠈⠑⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⠒⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⢀⣣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠒⠢⠤⠄⣀⣀⠀⠀⠀⢠⣿⡟⠀⠀⠀⣺⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⣿⠇⠀⠀⠀⠀⠀⣤⡄⠀⠀⢠⣤⡄⠀⢨⣭⣠⣤⣤⣤⡀⠀⠀⢀⣤⣤⣤⣤⡄⠀⠀⠀⣤⣄⣤⣤⣤⠀⠀⣿⣯⠉⠉⣿⡟⠀⠈⢩⣭⣤⣤⠀⠀⠀⠀⣠⣤⣤⣤⣄⣤⣤",
      "⢠⣿⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⣸⣿⠁⠀⣿⣿⠉⠀⠈⣿⡇⠀⠀⠛⠋⠀⠀⢹⣿⠀⠀⠀⣿⠏⠀⠸⠿⠃⠀⣿⣿⠀⣰⡟⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⣿⡟⢸⣿⡇⢀⣿",
      "⣸⡇⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⣿⡟⠀⢠⣿⡇⠀⠀⢰⣿⡇⠀⣰⣾⠟⠛⠛⣻⡇⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⢻⣿⢰⣿⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⢸⣿⠇⢸⣿⠀⢸⡏",
      "⣿⣧⣤⣤⣤⡄⠀⠘⣿⣤⣤⡤⣿⠇⠀⢸⣿⠁⠀⠀⣼⣿⠀⠀⢿⣿⣤⣤⠔⣿⠃⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⠋⠀⠀⠀⢠⣤⣤⣿⣥⣤⡄⠀⣼⣿⠀⣸⡏⠀⣿⠃",
      "⠉⠉⠉⠉⠉⠁⠀⠀⠈⠉⠉⠀⠉⠀⠀⠈⠉⠀⠀⠀⠉⠉⠀⠀⠀⠉⠉⠁⠈⠉⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠉⠁⠀⠉⠁⠀⠉⠀",
    },
    footer = { "chrisatmachine.com" },
  },
}

require "lv-zen.config"
