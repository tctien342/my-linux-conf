local tailwindcss_opts = function(opts)
  opts.root_dir = require 'lspconfig'.util.root_pattern('tailwind.config.js', 'tailwind.config.ts',
    'postcss.config.js', 'postcss.config.ts',
    'package.json', 'node_modules', '.git')
  opts.settings = {
    tailwindCSS = {
      classAttributes = { 'class', 'className', 'classList', 'ngClass' },
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidConfigPath = 'error',
        invalidScreen = 'error',
        invalidTailwindDirective = 'error',
        invalidVariant = 'error',
        recommendedVariantOrder = 'warning'
      },
      validate = true
    }
  }
end

return tailwindcss_opts
