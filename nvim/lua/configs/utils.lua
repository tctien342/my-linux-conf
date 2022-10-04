--- This file contains tools
function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

function wait(seconds)
  local start = os.time()
  repeat
  until os.time() > start + seconds
end

return { map = map, wait = wait }
